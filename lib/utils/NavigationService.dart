import 'package:flutter/cupertino.dart';

import '../utils/allExport.dart';

class NavigationService {
  /// Todo: Pop the current screen
  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  /// Todo: Push a new screen with Cupertino (iOS) animation
  static Future<T?> push<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
  }) async {
    return navigatorKey.currentState?.push<T>(
      CupertinoPageRoute(
        builder: (_) => page,
        settings: settings,
      ),
    );
  }

  /// Todo: Replace screen and remove previous using Cupertino animation
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
    bool Function(Route<dynamic>)? predicate,
  }) async {
    predicate ??= (route) => false;
    return navigatorKey.currentState?.pushAndRemoveUntil<T>(
      CupertinoPageRoute(
        builder: (_) => page,
        settings: settings,
      ),
      predicate,
    );
  }

  /// Todo: Replace current screen with Cupertino transition
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    RouteSettings? settings,
    TO? result,
  }) async {
    return navigatorKey.currentState?.pushReplacement<T, TO>(
      CupertinoPageRoute(
        builder: (_) => page,
        settings: settings,
      ),
      result: result,
    );
  }

  /// Todo: Pop until a specific route
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }
}
