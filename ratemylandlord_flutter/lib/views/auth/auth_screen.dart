import 'package:flutter/material.dart';
import 'package:ratemylandlord_flutter/views/auth/sign_in_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(),
    );
  }
}
