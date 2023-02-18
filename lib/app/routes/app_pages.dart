import 'package:acronyms_flutter/app/modules/landing/landing_view.dart';
import 'package:go_router/go_router.dart';
import '/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Paths.landing,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.landing,
        path: Paths.landing,
        builder: (context, state) => const LandingView(),
      ),
    ],
  );
}
