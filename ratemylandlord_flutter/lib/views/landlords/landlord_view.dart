import 'package:app_components/extensions/string/capitalize_first_letter.dart';
import 'package:app_components/extensions/text_style_modifiers.dart';
import 'package:app_components/styles/styles.dart';
import 'package:app_components/widgets/app_single_child_scroll_view.dart';
import 'package:app_components/widgets/spacers/spacer_xxs.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ratemylandlord_client/ratemylandlord_client.dart';

class LandlordView extends StatelessWidget {
  const LandlordView({
    super.key,
    required this.landlord,
  });

  final Landlord landlord;

  @override
  Widget build(BuildContext context) {
    int rating = 1 + Faker().randomGenerator.integer(5, min: 0);
    return Padding(
      padding: const EdgeInsets.all(Styles.ds),
      child: Column(
        spacing: Styles.dl,
        children: [
          Text(
            'Rating: $rating/5',
            style: Theme.of(context).textTheme.headlineMedium?.withColor(
                  switch (rating) {
                    1 => Colors.red[700]!,
                    2 => Colors.orange[700]!,
                    3 => Colors.yellow[700]!,
                    4 => Colors.green[700]!,
                    5 => Colors.blue[700]!,
                    _ => Colors.black // Will not happen,
                  },
                ),
          ),
          Expanded(
            child: AppSingleChildScrollView(
              child: Column(
                spacing: Styles.dxs,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(100, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      borderRadius: BorderRadius.circular(Styles.dl),
                    ),
                    padding: EdgeInsets.all(
                      Styles.dxs,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Faker().lorem.words(random.integer(5, min: 1)).join(' ').capitalizeFirstLetter(),
                          style: Theme.of(context).textTheme.titleMedium?.withColor(
                                Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                        SpacerXXS(),
                        Text(
                          Faker().lorem.sentences(3).join(' '),
                          softWrap: true,
                        ),
                        SpacerXXS(),
                        Text(
                          '- ${Faker().person.name()}',
                          style: Theme.of(context).textTheme.labelSmall?.withColor(
                                Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
