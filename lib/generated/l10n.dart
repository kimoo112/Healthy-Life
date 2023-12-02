// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `signin`
  String get signinButton {
    return Intl.message(
      'signin',
      name: 'signinButton',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Find the perfect recipe`
  String get onBoardingTitle {
    return Intl.message(
      'Find the perfect recipe',
      name: 'onBoardingTitle',
      desc: '',
      args: [],
    );
  }

  /// ` Everyday`
  String get everyday {
    return Intl.message(
      ' Everyday',
      name: 'everyday',
      desc: '',
      args: [],
    );
  }

  /// `More than 20 thousand recipes of healthy and delicious food`
  String get onBoardingSlogan {
    return Intl.message(
      'More than 20 thousand recipes of healthy and delicious food',
      name: 'onBoardingSlogan',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onBoardingButton {
    return Intl.message(
      'Get Started',
      name: 'onBoardingButton',
      desc: '',
      args: [],
    );
  }

  /// `Poppins`
  String get fontFamily {
    return Intl.message(
      'Poppins',
      name: 'fontFamily',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get Recipes {
    return Intl.message(
      'Recipes',
      name: 'Recipes',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popularCategory {
    return Intl.message(
      'Popular',
      name: 'popularCategory',
      desc: '',
      args: [],
    );
  }

  /// `Healthy`
  String get healthyCategory {
    return Intl.message(
      'Healthy',
      name: 'healthyCategory',
      desc: '',
      args: [],
    );
  }

  /// `Soup`
  String get soupCategory {
    return Intl.message(
      'Soup',
      name: 'soupCategory',
      desc: '',
      args: [],
    );
  }

  /// `Snacks`
  String get snacksCategory {
    return Intl.message(
      'Snacks',
      name: 'snacksCategory',
      desc: '',
      args: [],
    );
  }

  /// `No favorite recipes yet? Explore our delicious collection and add your favorites! 🍲🥗`
  String get noFavoritesMessage {
    return Intl.message(
      'No favorite recipes yet? Explore our delicious collection and add your favorites! 🍲🥗',
      name: 'noFavoritesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorites`
  String get yourFavorites {
    return Intl.message(
      'Your Favorites',
      name: 'yourFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsTitle {
    return Intl.message(
      'Contact Us',
      name: 'contactUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap to start a WhatsApp chat`
  String get contactUsSubtitle {
    return Intl.message(
      'Tap to start a WhatsApp chat',
      name: 'contactUsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover My GitHub`
  String get discoverGitHubTitle {
    return Intl.message(
      'Discover My GitHub',
      name: 'discoverGitHubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore My Repos, See latest Commits`
  String get discoverGitHubSubtitle {
    return Intl.message(
      'Explore My Repos, See latest Commits',
      name: 'discoverGitHubSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutTitle {
    return Intl.message(
      'Logout',
      name: 'logoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Securely sign out from your account`
  String get logoutSubtitle {
    return Intl.message(
      'Securely sign out from your account',
      name: 'logoutSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `App Notification`
  String get appNotificationTitle {
    return Intl.message(
      'App Notification',
      name: 'appNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `You'll receive updates and alerts`
  String get enabledSubtitle {
    return Intl.message(
      'You\'ll receive updates and alerts',
      name: 'enabledSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You won't receive updates and alerts`
  String get disabledSubtitle {
    return Intl.message(
      'You won\'t receive updates and alerts',
      name: 'disabledSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `What Do You Want to Train`
  String get wantTrain {
    return Intl.message(
      'What Do You Want to Train',
      name: 'wantTrain',
      desc: '',
      args: [],
    );
  }

  /// `Fullbody Workout`
  String get fullbodyWorkout {
    return Intl.message(
      'Fullbody Workout',
      name: 'fullbodyWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Upperbody Workout`
  String get upperbodyWorkout {
    return Intl.message(
      'Upperbody Workout',
      name: 'upperbodyWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `at`
  String get at {
    return Intl.message(
      'at',
      name: 'at',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Lowebody Workout`
  String get lowerbodyWorkout {
    return Intl.message(
      'Lowebody Workout',
      name: 'lowerbodyWorkout',
      desc: '',
      args: [],
    );
  }

  /// `AB Workout`
  String get abWorkout {
    return Intl.message(
      'AB Workout',
      name: 'abWorkout',
      desc: '',
      args: [],
    );
  }

  /// `mins`
  String get mins {
    return Intl.message(
      'mins',
      name: 'mins',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get SeeMore {
    return Intl.message(
      'See More',
      name: 'SeeMore',
      desc: '',
      args: [],
    );
  }

  /// `Workout Tracker`
  String get workoutTracker {
    return Intl.message(
      'Workout Tracker',
      name: 'workoutTracker',
      desc: '',
      args: [],
    );
  }

  /// `Daily Workout Schedule`
  String get dailyWorkoutSchedule {
    return Intl.message(
      'Daily Workout Schedule',
      name: 'dailyWorkoutSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Workout`
  String get upcomingWorkout {
    return Intl.message(
      'Upcoming Workout',
      name: 'upcomingWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get Check {
    return Intl.message(
      'Check',
      name: 'Check',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get ViewMore {
    return Intl.message(
      'View More',
      name: 'ViewMore',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get cm {
    return Intl.message(
      'cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `HEIGHT`
  String get height {
    return Intl.message(
      'HEIGHT',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `WEIGHT`
  String get weight {
    return Intl.message(
      'WEIGHT',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `AGE`
  String get age {
    return Intl.message(
      'AGE',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `CALCULATE`
  String get calculate {
    return Intl.message(
      'CALCULATE',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `Re-CALCULATE`
  String get recalculate {
    return Intl.message(
      'Re-CALCULATE',
      name: 'recalculate',
      desc: '',
      args: [],
    );
  }

  /// `Your Result`
  String get yourResult {
    return Intl.message(
      'Your Result',
      name: 'yourResult',
      desc: '',
      args: [],
    );
  }

  /// `CALCULATE Your Bmi`
  String get calculateYourBmi {
    return Intl.message(
      'CALCULATE Your Bmi',
      name: 'calculateYourBmi',
      desc: '',
      args: [],
    );
  }

  /// `Calculate your BMI and track your health`
  String get calculateYourBmisub {
    return Intl.message(
      'Calculate your BMI and track your health',
      name: 'calculateYourBmisub',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
