import 'package:app_components/observers/device.dart';
import 'package:flutter/foundation.dart';
import 'package:ratemylandlord_client/ratemylandlord_client.dart';
import 'package:flutter/material.dart';

import 'package:ratemylandlord_flutter/router.dart';
import 'package:ratemylandlord_flutter/src/serverpod_client.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

  runApp(
    Device(
      isMobile:
          [
            TargetPlatform.iOS,
            TargetPlatform.android,
          ].contains(
            defaultTargetPlatform,
          ) &&
          !kIsWeb,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Rate My Landlord',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}
