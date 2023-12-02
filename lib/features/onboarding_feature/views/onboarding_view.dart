import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:healthy_food/core/widgets/annotated_scaffold.dart';
import 'package:healthy_food/features/onboarding_feature/widgets/onboarding_body.dart';
import 'package:uuid/uuid.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      int id = const Uuid().v4().hashCode;

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
          id: id,
          channelKey: "firebase key",
          title: message.notification!.title,
          body: message.notification!.body,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedScaffold(
      child: OnBoardingBodyWidget(),
    );
  }
}
