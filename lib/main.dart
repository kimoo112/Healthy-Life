// ignore_for_file: unused_local_variable

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/bloc_observer.dart';
import 'package:healthy_food/features/auth/logic/cubit/google_auth_cubit.dart';
import 'package:healthy_food/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:healthy_food/features/profile/logic/cubit/profile_image_cubit.dart';
import 'package:healthy_food/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app_router.dart';
import 'core/constants/strings.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/ar_app_theme.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Strings.switchersBox);
  MyBlocObserver();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic key',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelKey: 'firebase key',
        channelName: 'firebase notifications',
        channelDescription: 'Notification channel for basic tests',
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      )
    ],
  );
  FirebaseMessaging masseging = FirebaseMessaging.instance;
  NotificationSettings settings = await masseging.requestPermission();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
            BlocProvider(
              create: (context) => GoogleAuthCubit(),
            ),
            BlocProvider(
              create: (context) => ProfileImageCubit(),
            ),
          ],
          child: ValueListenableBuilder(
            valueListenable: Hive.box(Strings.switchersBox).listenable(),
            builder: (BuildContext context, box, Widget? child) {
              String isArabic =
                  box.get(Strings.languageValue, defaultValue: "en");
              return MaterialApp.router(
                locale: Locale(isArabic),

                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'Healthy Food',
                theme: isArabic == 'ar'
                    ? arMainTheme
                    : mainTheme, // Pass the context to mainTheme
                routerConfig: AppRouter.appRouter,
              );
            },
          ),
        );
      },
    );
  }
}
