import 'package:app_components/enums/button_color_scheme.dart';
import 'package:app_components/extensions/text_style_modifiers.dart';
import 'package:app_components/navigation/side_sheets/side_sheet_host.dart';
import 'package:app_components/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ratemylandlord_client/ratemylandlord_client.dart';
import 'package:app_components/widgets/buttons/app_button.dart';
import 'package:ratemylandlord_flutter/src/serverpod_client.dart';
import 'package:ratemylandlord_flutter/views/landlords/landlord_card.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> {
  final _firstNameEditingController = TextEditingController();
  final _lastNameEditingController = TextEditingController();

  List<Landlord> foundLandlords = [];

  Future<void> _callCreateLandlord() async {
    try {
      await client.landlords.create(
        firstName: _firstNameEditingController.text,
        lastName: _lastNameEditingController.text,
      );
    } catch (e) {}
  }

  Future<void> _callFindLandlords() async {
    try {
      List<Landlord> landlords = await client.landlords.find(
        firstName: _firstNameEditingController.text,
        lastName: _lastNameEditingController.text,
      );

      setState(() {
        foundLandlords = landlords;
      });
    } catch (e) {}
  }

  Future<void> _callListLandlords() async {
    try {
      List<Landlord> landlords = await client.landlords.list();

      setState(() {
        foundLandlords = landlords;
      });
    } catch (e) {}
  }

  void _callDeleteAllLandlords() async {
    try {
      await client.landlords.deleteAll();

      setState(() {
        _firstNameEditingController.clear();
        _lastNameEditingController.clear();
        foundLandlords = [];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    bool searchTextPresent = _firstNameEditingController.text.isNotEmpty && _lastNameEditingController.text.isNotEmpty;

    return NestedSideSheet(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: Styles.dl,
            children: [
              Row(
                spacing: Styles.dm,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _firstNameEditingController,
                      decoration: const InputDecoration(hintText: 'Enter landlord\'s first name'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _lastNameEditingController,
                      decoration: const InputDecoration(hintText: 'Enter landlord\'s last name'),
                    ),
                  ),
                  AppButton(
                    onPressed: _callFindLandlords,
                    child: const Text('Search'),
                  ),
                  AppButton(
                    colorScheme: ButtonColorScheme.outline,
                    onPressed: () {
                      _firstNameEditingController.clear();
                      _lastNameEditingController.clear();

                      _callListLandlords();
                    },
                    child: const Text('All'),
                  ),
                  AppButton(
                    child: Text('Log Out'),
                    onPressed: () async {
                      await sessionManager.signOutDevice();
                    },
                  ),
                ],
              ),
              Expanded(
                child: foundLandlords.isEmpty
                    ? Column(
                        spacing: Styles.dxs,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Styles.dl),
                            child: Text(
                              searchTextPresent ? 'No landlords found.' : 'Search for landlords.',
                              style: Theme.of(context).textTheme.bodyLarge?.withColor(
                                Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          if (searchTextPresent) ...[
                            AppButton(
                              colorScheme: ButtonColorScheme.outline,
                              iconData: Icons.add,
                              onPressed: () async {
                                String firstName = _firstNameEditingController.text;
                                String lastName = _lastNameEditingController.text;
                                try {
                                  await _callCreateLandlord();
                                  List<Landlord> landlords = await client.landlords.find(
                                    firstName: firstName,
                                    lastName: lastName,
                                  );
                                  setState(() {
                                    foundLandlords = landlords;
                                  });
                                } catch (e) {}
                              },
                              child: Text('Add ${_firstNameEditingController.text} ${_lastNameEditingController.text}'),
                            ),
                          ],
                        ],
                      )
                    : ListView.builder(
                        itemCount: foundLandlords.length,
                        itemBuilder: (context, index) {
                          final landlord = foundLandlords[index];
                          return ListTile(
                            title: LandlordCard(
                              landlord: landlord,
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AppButton(
                  colorScheme: ButtonColorScheme.alertOutline,
                  onPressed: _callDeleteAllLandlords,
                  child: const Text('Delete All'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
