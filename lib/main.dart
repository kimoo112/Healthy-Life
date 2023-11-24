import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/bloc_observer.dart';
import 'package:healthy_food/features/auth/logic/cubit/google_auth_cubit.dart';
import 'package:healthy_food/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:healthy_food/features/profile/logic/cubit/profile_image_cubit.dart';
import 'package:healthy_food/firebase_options.dart';

import 'core/app_router.dart';
import 'core/theme/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging masseging = FirebaseMessaging.instance;
  NotificationSettings settings = await masseging.requestPermission();
  // await initializeDependencies();
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
//             BlocProvider<RemoteExerciseBloc>(
//   create: (context) => RemoteExerciseBloc(
//     GetExerciseUseCase(sl()), 
//     exerciseApiService: ExerciseApiService(sl()),
//     exerciseRepository: ExerciseRepoImpl(sl(), sl()),
//   )..add(const GetExerciseEvent()),
// ),
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
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Healthy Food',
              theme: mainTheme,
              routerConfig: AppRouter.appRouter,
            ),
          );
        });
  }
}
