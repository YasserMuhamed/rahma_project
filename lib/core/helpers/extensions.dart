import 'package:rahma_project/generated/l10n.dart';
import 'package:flutter/widgets.dart';

/// Extension to simplify navigation using BuildContext.
/// Provides helper methods for common navigation actions.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoNavigation on BuildContext {
  /// Navigates to a new location. This replaces the entire navigation stack
  /// with the new route. Used for navigation flows that require a complete reset
  /// (e.g., logging in or out, or deep-linking).
  ///
  /// Corresponds roughly to the traditional `pushNamedAndRemoveUntil` behavior.
  void go(String location, {Object? extra}) {
    GoRouter.of(this).go(location, extra: extra);
  }

  /// Navigates to a new location by name. This replaces the entire stack.
  void goNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).goNamed(routeName, extra: extra);
  }

  /// Adds a new route on top of the current route stack.
  /// The current route is preserved, allowing the user to navigate back.
  ///
  /// Corresponds to the traditional `pushNamed` behavior.
  void push(String location, {Object? extra}) {
    GoRouter.of(this).push(location, extra: extra);
  }

  /// Adds a new named route on top of the current route stack.
  void pushNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).pushNamed(routeName, extra: extra);
  }

  /// Replaces the top-most route in the stack with a new route.
  /// The user cannot navigate back to the previous route.
  ///
  /// Corresponds to the traditional `pushReplacementNamed` behavior.
  void replace(String location, {Object? extra}) {
    GoRouter.of(this).replace(location, extra: extra);
  }

  /// Replaces the top-most named route in the stack with a new named route.
  void replaceNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).replaceNamed(routeName, extra: extra);
  }

  /// Pops the top-most route off the navigator.
  /// Note: GoRouter's pop does not take a result parameter like the traditional Navigator.
  void pop() {
    GoRouter.of(this).pop();
  }

  /// Checks if the current route can be popped off the navigator.
  bool canPop() {
    return GoRouter.of(this).canPop();
  }
}

/// Extension to easily access MediaQuery properties from BuildContext.
extension MediaQueryValues on BuildContext {
  /// Returns the screen width.
  double get width => MediaQuery.of(this).size.width;

  /// Returns the screen height.
  double get height => MediaQuery.of(this).size.height;

  /// Returns the device pixel ratio.
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Returns the padding around the screen.
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns the view insets (e.g., keyboard height).
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Returns the current screen orientation.
  Orientation get orientation => MediaQuery.of(this).orientation;
}

/// Extension for nullable String to check if it is null or empty.
extension StringExtension on String? {
  /// Returns true if the string is null or empty.
  bool isNullOrEmpty() => this == null || this == "";
}

/// Extension for nullable List to check if it is null or empty.
extension ListExtension<T> on List<T>? {
  /// Returns true if the list is null or empty.
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// Extension to convert a String to a Locale object.
/// Useful for localization and language handling.
extension StringToLocaleHelper on String {
  /// Converts the string to a Locale.
  /// Example: "en_US" or "zh_Hans_CN"
  Locale toLocale({String separator = '_'}) {
    final localeList = split(separator);
    switch (localeList.length) {
      case 2:
        return localeList.last.length ==
                4 // scriptCode length is 4
            ? Locale.fromSubtags(languageCode: localeList.first, scriptCode: localeList.last)
            : Locale(localeList.first, localeList.last);
      case 3:
        return Locale.fromSubtags(languageCode: localeList.first, scriptCode: localeList[1], countryCode: localeList.last);
      default:
        return Locale(localeList.first);
    }
  }
}

extension ExpandWidget on Widget {
  Widget expanded() => Expanded(child: this);
}

extension IconSize on Widget {
  Widget to16Icon() => SizedBox(width: 16, height: 16, child: this);
  Widget to20Icon() => SizedBox(width: 20, height: 20, child: this);
  Widget to24Icon() => SizedBox(width: 24, height: 24, child: this);
  Widget to32Icon() => SizedBox(width: 32, height: 32, child: this);
}

extension Translation on BuildContext {
  S get t => S.of(this);
}
