import 'package:flutter/material.dart';
import 'package:ratemylandlord_flutter/src/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

const _googleServerClientId = '306124830006-at1oirrvdapntb7hp37ullqjnrbga9r5.apps.googleusercontent.com';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SignInWithEmailButton(
                caller: client.modules.auth,
              ),
              SignInWithGoogleButton(
                caller: client.modules.auth,
                redirectUri: Uri.parse('http://localhost:8082/googlesignin'),
                serverClientId: _googleServerClientId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
