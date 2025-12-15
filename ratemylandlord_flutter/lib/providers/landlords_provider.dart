import 'package:ratemylandlord_client/ratemylandlord_client.dart';
import 'package:ratemylandlord_flutter/src/serverpod_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'landlords_provider.g.dart';

@Riverpod(keepAlive: true)
class LandlordsNotifier extends _$LandlordsNotifier {
  @override
  FutureOr<List<Landlord>> build() async {
    return await client.landlords.list();
  }
}
