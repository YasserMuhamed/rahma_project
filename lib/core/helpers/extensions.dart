import 'package:rahma_project/generated/l10n.dart';
import 'package:flutter/widgets.dart';

/// Extension to simplify navigation using BuildContext.
/// Provides helper methods for common navigation actions.
extension Navigation on BuildContext {
  /// Pushes a named route onto the navigator.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replaces the current route by pushing a named route and removing the previous one.
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pushes a named route and removes routes until the predicate returns true.
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// Pops the top-most route off the navigator.
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
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
            ? Locale.fromSubtags(
                languageCode: localeList.first,
                scriptCode: localeList.last,
              )
            : Locale(localeList.first, localeList.last);
      case 3:
        return Locale.fromSubtags(
          languageCode: localeList.first,
          scriptCode: localeList[1],
          countryCode: localeList.last,
        );
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
