import 'package:go_router/go_router.dart';

import '../features/authentication/sign_in/sign_in_screen.dart';
import '../features/revenue_view/revenue_screen.dart';
import '../features/scm/presentaton/scm_screen.dart';
import '../features/scm/widgets/no_data_screen.dart';
import '../features/scm_data/presentation/scm_data_screen.dart';

class AppRoutes {
  AppRoutes._(); // private constructor

  // Route names
  static const String signin = '/signin';
  static const String scmScreen = '/scmScreen';
  static const String noDataScreen = '/noDataScreen';
  static const String scmDataScreen = '/scmDataScreen';
  static const String revenueScreen = '/revenueScreen';

  // GoRouter instance
  static final GoRouter router = GoRouter(
    initialLocation: scmDataScreen,
    routes: [
      GoRoute(path: signin, builder: (context, state) => const SignInScreen()),
      GoRoute(path: scmScreen, builder: (context, state) => const ScmScreen()),
      GoRoute(
        path: noDataScreen,
        builder: (context, state) => const NoDataScreen(),
      ),
      GoRoute(
        path: scmDataScreen,
        builder: (context, state) => const ScmDataScreen(),
      ),
      GoRoute(
        path: revenueScreen,
        builder: (context, state) => const RevenueScreen(),
      ),
    ],
  );
}
