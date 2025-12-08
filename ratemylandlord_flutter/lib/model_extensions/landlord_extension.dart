import 'package:ratemylandlord_client/ratemylandlord_client.dart';

extension LandlordExtension on Landlord {
  /// Returns the full name of the landlord.
  String get name => '$firstName $lastName';
}
