import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ratemylandlord_client/ratemylandlord_client.dart';
import 'package:ratemylandlord_flutter/model_extensions/landlord_extension.dart';
import 'package:ratemylandlord_flutter/providers/landlords_provider.dart';

class LandlordsView extends ConsumerWidget {
  final List<Landlord> landlords;

  const LandlordsView({
    super.key,
    required this.landlords,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: landlords.length,
      itemBuilder: (context, index) {
        final landlord = landlords[index];
        return ListTile(
          title: Text(landlord.name),
        );
      },
    );
    // return ref.watch(landlordsProvider).when(
    //       data: (List<Landlord> landlords) {
    //         if (landlords.isEmpty) {
    //           return const Text('No landlords found.');
    //         }

    //         return ListView.builder(
    //           itemCount: landlords.length,
    //           itemBuilder: (context, index) {
    //             final landlord = landlords[index];
    //             return ListTile(
    //               title: Text(landlord.name),
    //             );
    //           },
    //         );
    //       },
    //       error: (e, _) => Text(e.toString()),
    //       loading: () => const CircularProgressIndicator(),
    //     );
  }
}
