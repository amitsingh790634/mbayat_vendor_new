import 'package:flutter/cupertino.dart';

import '../utils/allExport.dart';

class NavigationService {
  /// Generate RouteSettings with screen name
  static RouteSettings _createSettings(Widget page) {
    return RouteSettings(
      name: page.runtimeType.toString(), // ✅ SCREEN NAME
    );
  }

  /// Pop
  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  /// Push
  static Future<T?> push<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.push<T>(
      CupertinoPageRoute(
        builder: (_) => page,
        settings: _createSettings(page), // ✅ IMPORTANT
      ),
    );
  }

  /// Push & Remove Until
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page, {
    bool Function(Route<dynamic>)? predicate,
  }) {
    predicate ??= (_) => false;

    return navigatorKey.currentState!.pushAndRemoveUntil<T>(
      CupertinoPageRoute(builder: (_) => page, settings: _createSettings(page)),
      predicate,
    );
  }

  /// Push Replacement
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return navigatorKey.currentState!.pushReplacement<T, TO>(
      CupertinoPageRoute(builder: (_) => page, settings: _createSettings(page)),
      result: result,
    );
  }

  /// Pop Until
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }
}
