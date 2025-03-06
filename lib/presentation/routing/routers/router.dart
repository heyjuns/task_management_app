import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/presentation/routing/routers/task_router.dart';
import 'package:task_management_app/presentation/routing/routes/task_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: TaskRoutes.base,
  routes: [TaskRouter.main],
);
