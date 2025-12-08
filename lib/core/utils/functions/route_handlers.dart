import 'package:rahma_project/core/helpers/constants.dart';
import 'package:rahma_project/config/routing/app_routes.dart';

String routeHandler() {
  return hasPassedIntro
      ? hasToken
            ? Routes.bottomNavView
            : Routes.loginScreen
      : Routes.onBoardingScreen;
}
