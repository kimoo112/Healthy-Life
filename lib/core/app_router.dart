import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'constants/routes.dart';
import '../features/auth/logic/cubit/google_auth_cubit.dart';
import '../features/auth/views/signin_view.dart';
import '../features/base/base_screen.dart';
import '../features/bmi_calc/views/input_view.dart';
import '../features/favorite/views/favorite_view.dart';
import '../features/home/data/recipe_model.dart';
import '../features/home/views/home_view.dart';
import '../features/onboarding/views/onboarding_view.dart';
import '../features/profile/views/profile_view.dart';

class AppRouter {
  late List<RecipeModel> recipeModel;
  static final appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: bmi,
        builder: (context, state) => const InputView(),
      ),
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
