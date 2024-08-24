import 'package:flutter/material.dart';
import 'package:medhub/routes.dart';
import 'package:medhub/services/navigation_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: RouteGenerator().generateRoutes,
      initialRoute: '/',
    );
  }
}
