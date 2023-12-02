import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_food/core/theme/app_colors.dart';
import 'package:healthy_food/features/profile/widgets/custom_profile_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/constants/routes.dart';
import '../../../core/constants/strings.dart';
import '../../../generated/l10n.dart';
import '../../auth/logic/cubit/google_auth_cubit.dart';
import 'custom_switch_tile.dart';

class AllProfileListTiles extends StatefulWidget {
  const AllProfileListTiles({
    super.key,
  });

  @override
  State<AllProfileListTiles> createState() => _AllProfileListTilesState();
}

class _AllProfileListTilesState extends State<AllProfileListTiles> {
  bool isAllowed = true;

  void saveSwitchValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switch', isAllowed);
    getSwitchValue();
  }

  getSwitchValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('switch') != null) {
      isAllowed = prefs.getBool('switch')!;
      setState(() {});
    } else {
      debugPrint('Switch value');
    }
  }

  @override
  void initState() {
    super.initState();
    getSwitchValue();
  }

  Box switchers = Hive.box(Strings.switchersBox);
  String? isArabic;
  @override
  Widget build(BuildContext context) {
    // var themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Column(
      children: [
        // CustomProfileTile(
        //   icon: Iconsax.global,
        ListTile(
          leading: const Icon(
            Iconsax.global,
            color: AppColors.bodySmallTextColor,
          ),
          title: Text(S.of(context).Language),
          trailing: ValueListenableBuilder(
            valueListenable: Hive.box(Strings.switchersBox).listenable(),
            builder: (BuildContext context, box, Widget? child) {
              isArabic = box.get(Strings.languageValue, defaultValue: "en");
              return PopupMenuButton<String>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.bodySmallTextColor,
                ),
                onSelected: (String value) {
                  switchers.put(Strings.languageValue, value);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: "en",
                    child: Text(
                      "   English",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: "ar",
                    child: Text(
                      "    العربية ",
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 5.h,
        ),

        CustomSwitchTile(
          isAllowed: isAllowed,
          leadingIcon: IconlyLight.notification,
          title: S.of(context).appNotificationTitle,
          enabledSubtitle: S.of(context).enabledSubtitle,
          disabledSubtitle: S.of(context).disabledSubtitle,
          onChanged: (p0) {
            isAllowed = !isAllowed;
            saveSwitchValue();
            setState(() {});
          },
        ),

        CustomProfileTile(
          icon: Iconsax.message,
          title: S.of(context).contactUsTitle,
          subtitle: S.of(context).contactUsSubtitle,
          onTap: () {
            _launchUrl(Strings.whatsappUrl);
          },
        ),
        CustomProfileTile(
          icon: Iconsax.health,
          title: S.of(context).calculateYourBmi,
          subtitle: S.of(context).calculateYourBmisub,
          onTap: () {
            context.push(bmi);
          },
        ),
        CustomProfileTile(
          icon: Ionicons.logo_github,
          title: S.of(context).discoverGitHubTitle,
          subtitle: S.of(context).discoverGitHubSubtitle,
          onTap: () async {
            await _launchUrl(Strings.githubUrl);
          },
        ),

        CustomProfileTile(
          icon: Iconsax.logout,
          title: S.of(context).logoutTitle,
          subtitle: S.of(context).logoutSubtitle,
          onTap: () {
            BlocProvider.of<GoogleAuthCubit>(context).signout(context);
          },
        ),
        SizedBox(
          height: 55.h,
        )
      ],
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
