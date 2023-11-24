// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthy_food/core/constants/routes.dart';

import '../../../profile/logic/cubit/profile_image_cubit.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());
  final user = FirebaseAuth.instance;
  Future signInWithGoogle(BuildContext context) async {
    try {
      emit(GoogleAuthLoading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(GoogleAuthFailure(errorMsg: 'You Should Choose An Account'));
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleAuthSuccess());
      context.go(onboarding);
    } on FirebaseAuthException catch (e) {
      emit(GoogleAuthFailure(errorMsg: e.message ?? "An error occurred"));
    } on Exception catch (e) {
      emit(GoogleAuthFailure(errorMsg: e.toString()));
    }
  }

  signout(BuildContext context) {
    emit(GoogleAuthLoading());

    GoogleSignIn().disconnect();
    user.signOut();
    context.go(signin);
    BlocProvider.of<ProfileImageCubit>(context).deleteImage();
    emit(GoogleAuthSuccess());
  }
}
