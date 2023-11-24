import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_food/core/constants/routes.dart';
import 'package:healthy_food/features/auth/logic/cubit/google_auth_cubit.dart';
import 'package:healthy_food/features/auth/views/signin_view.dart';
import 'package:healthy_food/features/base/base_screen.dart';
import 'package:healthy_food/features/favorite/views/favorite_view.dart';
import 'package:healthy_food/features/home/data/recipe_model.dart';
import 'package:healthy_food/features/home/views/home_view.dart';
import 'package:healthy_food/features/onboarding_feature/views/onboarding_view.dart';
import 'package:healthy_food/features/profile/views/profile_view.dart';

class AppRouter {
  late List<RecipeModel> recipeModel;
  static final appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      // GoRoute(
      //   path: splash,
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: signin,
        builder: (context, state) => BlocProvider(
          create: (context) => GoogleAuthCubit(),
          child: const SignInScreen(),
        ),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: base,
        builder: (context, state) => const BaseScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: favorite,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: favorite,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
