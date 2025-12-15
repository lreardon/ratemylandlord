import 'package:ratemylandlord_server/src/generated/landlord.dart';
import 'package:serverpod/serverpod.dart';

class LandlordsEndpoint extends Endpoint {
  Future<List<Landlord>> list(Session session) async {
    return Landlord.db.find(session);
  }

  Future<void> deleteAll(Session session) async {
    await Landlord.db.deleteWhere(
      session,
      where: (l) => Constant.bool(true),
    );
  }

  Future<List<Landlord>> find(
    Session session, {
    required String firstName,
    required String lastName,
  }) async {
    return Landlord.db.find(
      session,
      where: (l) {
        return l.firstName.equals(firstName) & l.lastName.equals(lastName);
      },
    );
  }

  Future<Landlord> create(
    Session session, {
    required String firstName,
    required String lastName,
  }) async {
    Landlord landlord = await Landlord.db.insertRow(
      session,
      Landlord(
        firstName: firstName,
        lastName: lastName,
        addedByUserId: UuidValue.fromString('00000000-0000-0000-0000-000000000000'),
      ),
    );

    return landlord;
  }
}
