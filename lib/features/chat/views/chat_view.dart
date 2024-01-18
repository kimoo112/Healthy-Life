// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_food/core/theme/app_colors.dart';

import '../../../generated/l10n.dart';
import '../widgets/stream_builder_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late User signedInUser;
  final _firestore = FirebaseFirestore.instance;
  String? messageText;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onBoardingButtonColor,
        title: Text(
          S.of(context).ChatTitle,
          style: const TextStyle(color: AppColors.scaffoldBackgroundColor),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilderWidget(firestore: _firestore),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.onBoardingButtonColor,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.onBoardingButtonColor,
                      controller: controller,
                      onChanged: (value) {
                        messageText = value;
                      },
                      style: TextStyle(
                          color: AppColors.whiteColor.withOpacity(.7)),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintStyle: TextStyle(
                          fontFamily: S.of(context).fontFamily,
                        ),
                        hintText: S.of(context).writeYourMessage,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('masseges').add(
                        {
                          'massege': messageText,
                          'sender': signedInUser.displayName,
                          'time': FieldValue.serverTimestamp()
                        },
                      );
                      controller.clear();
                    },
                    child: Text(
                      S.of(context).sendMessage.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.onBoardingButtonColor,
                        fontFamily: S.of(context).fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
