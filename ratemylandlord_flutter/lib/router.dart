import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ratemylandlord_flutter/src/serverpod_client.dart';
import 'package:ratemylandlord_flutter/views/auth/auth_screen.dart';
import 'package:ratemylandlord_flutter/views/my_home_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

/// Notifier that listens to session changes and notifies GoRouter to refresh
class SessionRefreshNotifier extends ChangeNotifier {
  SessionRefreshNotifier(SessionManager sessionManager) {
    sessionManager.addListener(
      () {
        notifyListeners();
      },
    );
  }
}

final router = GoRouter(
  // Make the router refresh when the session status changes
  refreshListenable: SessionRefreshNotifier(sessionManager),
  redirect: (context, state) {
    final isSignedIn = sessionManager.isSignedIn;

    // Not signed in -> redirect to auth (unless already there)
    if (!isSignedIn) {
      return '/auth';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/auth',
      redirect: (context, state) {
        if (sessionManager.isSignedIn) {
          return '/';
        }
        return null;
      },
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(
        title: 'RateMyLandlord',
      ),
    ),
  ],
);
