import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app_fi/module/widget/add_page.dart';

import 'package:my_app_fi/module/widget/nav.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
      redirect: redirect,
      routes: routeList,
      errorBuilder: (context, state) {
        return const Scaffold();
      });

  GoRouter get router => _router;

  static List<GoRoute> get routeList {
    return [
      GoRoute(
        path: RouteConstants.root,
        pageBuilder: (context, state) {
          return routeWithTransition(
            child: Nav(),
          );
        },
      ),
      GoRoute(
        path: RouteConstants.add,
        pageBuilder: (context, state) {
          return routeWithTransition(
            child: AddPage(),
          );
        },
      ),
    ];
  }

  static Future<String?> Function(BuildContext, GoRouterState) redirect =
      (context, state) async {
    return null;
  };

  static CustomTransitionPage routeWithTransition({
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation1, animation2, child) {
        animation1 =
            CurvedAnimation(parent: animation1, curve: Curves.easeInOutCubic);
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}

class RouteConstants {
  static const String root = "/";
  static const String add = "/addPage";
}
