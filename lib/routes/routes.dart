import 'package:go_router/go_router.dart';

import '../features/authentication/sign_in/sign_in_screen.dart';
import '../features/scm/presentaton/scm_screen.dart';

class AppRoutes {
  AppRoutes._(); // private constructor

  // Route names
  static const String signin = '/signin';
  static const String scmScreen = '/scmScreen';

  // GoRouter instance
  static final GoRouter router = GoRouter(
    initialLocation: scmScreen,
    routes: [
      GoRoute(path: signin, builder: (context, state) => const SignInScreen()),
      GoRoute(path: scmScreen, builder: (context, state) => const ScmScreen()),
    ],
  );
}
