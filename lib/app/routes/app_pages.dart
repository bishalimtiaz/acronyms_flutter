import 'package:go_router/go_router.dart';
import '/app/routes/app_routes.dart';



class AppPages {
  AppPages._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Paths.LANDING,
    routes: <GoRoute>[
      // GoRoute(
      //     name: Routes.LANDING,
      //     path: Paths.LANDING,
      //     builder: (context, state) => LandingView()),
      // GoRoute(
      //     name: Routes.PROJECT_DETAILS,
      //     path: Paths.PROJECT_DETAILS,
      //     builder: (context, state) => ProjectDetailsView()),
    ],
  );
}
