
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/common/global_loader/global_loader.dart';
import 'package:myapp/common/widgets/popup_messages.dart';
import 'package:myapp/pages/sign_up/notifier/register_notifier.dart';
import 'package:myapp/pages/sign_up/repo/sign_up_repo.dart';

class SignUpController{
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // print("Your name is $name");
    // print("Your email is $email");
    // print("Your password is $password");
    // print("Your rePassword is $rePassword");

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }


    if ((state.password.isEmpty != state.rePassword.isEmpty )||
        password.isEmpty != rePassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Your password did not match");
      return;
    }
    //show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    
    Future.delayed(const Duration(seconds: 2), () async {
      var context = Navigator.of(ref.context);
      try {
        final credential = await SignUpRepo.firebaseSignUp(email, password);
        if (kDebugMode) {
          print(credential);
        }
        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          //get server photo url
          //set user photo url

          toastInfo(
              "An email has been sent to verify your account. Please open that email and confirm your identity");
          context.pop();
        }
      } on FirebaseAuthException catch (e) {
        if(e.code=='weak-password') {
          toastInfo("This password is too weak");
        }else if(e.code=='email-already-in-use'){
          toastInfo("This email address has already been registered");
        }else if(e.code =='user-not-found'){
          toastInfo("User not found");
        }
        print(e.code);
      } catch(e){
        if(kDebugMode){
          print
            (e.toString());
        }
      }
      //show the register page
      ref.watch(appLoaderProvider.notifier).setLoaderValue(false);

    });

  }
}