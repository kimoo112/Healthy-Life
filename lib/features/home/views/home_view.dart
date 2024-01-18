import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/annotated_scaffold.dart';
import '../../profile/logic/cubit/profile_image_cubit.dart';
import '../widgets/animated_appbar_widget.dart';
import '../widgets/animated_category_list.dart';
import '../widgets/animated_selected_category_widget.dart';
import '../widgets/healthy_list_view.dart';
import '../widgets/recipes_list_view.dart';
import '../widgets/snack_list_view.dart';
import '../widgets/soup_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileImageCubit>(context).loadImage();
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(2550.ms, () => changeListVisibility());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _showRecipeList = false;
  void changeListVisibility() {
    if (mounted) {
      setState(() {
        _showRecipeList = true;
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final avatarPlayDuration = 500.ms;
    final avatarWaitingDuration = 400.ms;
    final nameDelayDuration =
        avatarWaitingDuration + avatarWaitingDuration + 200.ms;
    final namePlayDuration = 800.ms;
    final categoryListPlayDuration = 750.ms;
    final categoryListDelayDuration =
        nameDelayDuration + namePlayDuration - 400.ms;
    final selectedCategoryPlayDuration = 400.ms;
    final selectedCategoryDelayDuration =
        categoryListDelayDuration + categoryListPlayDuration;
    return AnnotatedScaffold(
      child: DefaultTabController(
        length: 4,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedAppBarWidget(
                    avatarWaitingDuration: avatarWaitingDuration,
                    avatarPlayDuration: avatarPlayDuration,
                    nameDelayDuration: nameDelayDuration,
                    namePlayDuration: namePlayDuration,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedCategoryList(
                    tabController: _tabController,
                    categoryListPlayDuration: categoryListPlayDuration,
                    categoryListDelayDuration: categoryListDelayDuration,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedSelectedCategoryWidget(
                    selectedCategoryPlayDuration: selectedCategoryPlayDuration,
                    selectedCategoryDelayDuration:
                        selectedCategoryDelayDuration,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            _showRecipeList
                ? SliverFillRemaining(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        RecipeListView(),
                        HealthyListView(),
                        SoupListView(),
                        SnackListView(),
                      ],
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: SizedBox(),
                  ),
          ],
        ),
      ),
    );
  }
}
