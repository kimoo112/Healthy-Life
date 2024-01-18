import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_message_widget.dart';
import 'package:lottie/lottie.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({
    super.key,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('masseges').orderBy('time').snapshots(),
      builder: (BuildContext context, snapshot) {
        List<ChatMessageWidget> messagesList = [];

        if (!snapshot.hasData) {
          return Column(
            children: [Lottie.asset('assets/images/Empty Chat.json')],
          );
        }
        final currentUser = FirebaseAuth.instance.currentUser!.displayName;
        final masseges = snapshot.data!.docs;
        for (var massege in masseges) {
          final massegeText = massege.get('massege');
          final massegeSender = massege.get('sender');
          final isMe = currentUser == massegeSender;
          final massegesWidget = ChatMessageWidget(
            message: massegeText,
            sender: massegeSender,
            isMe: isMe,
          );
          messagesList.add(massegesWidget);
        }
        return Expanded(child: ListView(children: messagesList));
      },
    );
  }
}
