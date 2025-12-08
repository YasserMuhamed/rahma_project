import 'package:flutter/material.dart';
import 'package:rahma_project/core/helpers/constants.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/helpers/shared_prefs_keys.dart';
import 'package:rahma_project/core/helpers/shared_prefs_helper.dart';

Future<void> checkNavigation() async {
  final token = await SharedPrefsHelper.getSecuredString(
    SharedPrefsKeys.tokenKey,
  );
  debugPrint('hasTokenResult : $token');
  hasToken = !token.isNullOrEmpty();

  hasPassedIntro =
      await SharedPrefsHelper.getBool(SharedPrefsKeys.hasPassedIntro) ?? false;
  debugPrint('passedIntroCheckResult : $hasPassedIntro');
}
