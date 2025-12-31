import 'package:flutter/material.dart';

class AppRouteObserver extends NavigatorObserver {
  String _name(Route<dynamic>? route) {
    return route?.settings.name ?? 'UnknownScreen';
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('[PUSH] Screen: ${_name(route)}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('[POP] Screen: ${_name(previousRoute)}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('[REPLACE] Screen: ${_name(newRoute)}');
  }
}
