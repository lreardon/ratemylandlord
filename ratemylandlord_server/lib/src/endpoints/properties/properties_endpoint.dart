import 'package:ratemylandlord_server/src/generated/property.dart';
import 'package:serverpod/serverpod.dart';

class PropertiesEndpoint extends Endpoint {
  /// Get all properties
  Future<List<Property>> list(Session session) async {
    return Property.db.find(session);
  }

  /// Get a property by ID
  Future<Property?> getById(Session session, UuidValue id) async {
    return Property.db.findById(session, id);
  }

  /// Find a property by APN
  Future<Property?> findByApn(Session session, String apn) async {
    return Property.db.findFirstRow(
      session,
      where: (p) => p.apn.equals(apn),
    );
  }

  /// Search properties by partial APN match
  Future<List<Property>> search(Session session, String query) async {
    return Property.db.find(
      session,
      where: (p) => p.apn.ilike('%$query%'),
    );
  }

  /// Get total count of properties
  Future<int> count(Session session) async {
    return Property.db.count(session);
  }
}
