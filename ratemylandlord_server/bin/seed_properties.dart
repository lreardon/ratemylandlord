import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:ratemylandlord_server/src/generated/protocol.dart';
import 'package:ratemylandlord_server/src/generated/endpoints.dart';

/// Script to seed the database with property APNs from the JSON file.
///
/// Run with: dart run bin/seed_properties.dart
void main(List<String> args) async {
  // Initialize Serverpod in maintenance mode (doesn't start HTTP servers)
  final pod = Serverpod(
    ['--mode', 'development', '--role', 'maintenance'],
    Protocol(),
    Endpoints(),
  );

  // Start in maintenance mode - only connects to database, doesn't bind ports
  await pod.start();

  // Create a session
  final session = await pod.createSession();

  try {
    // Read the JSON file
    final file = File('../data/santa_cruz_city_registered_rentals_apns.json');
    if (!await file.exists()) {
      print('Error: File not found at ${file.path}');
      print('Make sure you run this from the ratemylandlord_server directory');
      exit(1);
    }

    final jsonString = await file.readAsString();
    final apns = (jsonDecode(jsonString) as List).cast<String>();

    print('Found ${apns.length} APNs to import...');

    // Check how many properties already exist
    final existingCount = await Property.db.count(session);
    print('Existing properties in database: $existingCount');

    // Insert properties
    int inserted = 0;
    int skipped = 0;

    for (final apn in apns) {
      // Check if property with this APN already exists
      final existing = await Property.db.findFirstRow(
        session,
        where: (p) => p.apn.equals(apn),
      );

      if (existing != null) {
        skipped++;
        continue;
      }

      await Property.db.insertRow(
        session,
        Property(apn: apn),
      );
      inserted++;

      // Progress indicator every 100 records
      if (inserted % 100 == 0) {
        print('Inserted $inserted properties...');
      }
    }

    print('\nDone!');
    print('Inserted: $inserted');
    print('Skipped (already existed): $skipped');
    print('Total in database: ${await Property.db.count(session)}');
  } catch (e, stackTrace) {
    print('Error: $e');
    print(stackTrace);
  } finally {
    await session.close();
    await pod.shutdown();
  }
}
