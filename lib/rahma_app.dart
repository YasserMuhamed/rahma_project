import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rahma_project/config/cubits/translation/localization_cubit.dart';
import 'package:rahma_project/config/theming/app_theme.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/generated/l10n.dart';
import 'config/routing/app_router.dart';

class RahmaApp extends StatelessWidget {
  const RahmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => getIt<LocaleCubit>())],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: router,
              locale: Locale(state.languageCode),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Rahma',
              theme: DarkEarthyTheme.themeData,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
