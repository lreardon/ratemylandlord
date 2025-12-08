import 'package:app_components/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:ratemylandlord_client/ratemylandlord_client.dart';
import 'package:ratemylandlord_flutter/keys.dart';
import 'package:ratemylandlord_flutter/model_extensions/landlord_extension.dart';
import 'package:app_components/navigation/side_sheets/show_side_sheet.dart';
import 'package:ratemylandlord_flutter/views/landlords/landlord_view.dart';

class LandlordCard extends StatelessWidget {
  final Landlord landlord;

  const LandlordCard({super.key, required this.landlord});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.showSideSheet(
          nestedSideSheetKey: sideSheetContainerKey,
          title: landlord.name,
          body: LandlordView(
            landlord: landlord,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Styles.dxs),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          padding: const EdgeInsets.all(Styles.ds),
          child: Text(
            landlord.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
      ),
    );
  }
}
