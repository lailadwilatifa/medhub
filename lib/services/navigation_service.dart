import 'package:flutter/material.dart';

class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic routeTo(String route) {
    return navigatorKey.currentState?.pushNamed(route);
  }

  dynamic routeToAndRemove(String route){
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}