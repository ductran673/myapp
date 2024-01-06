import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/global_loader/global_loader.dart';
import 'package:myapp/common/utils/app_colors.dart';
import 'package:myapp/common/utils/image_res.dart';
import 'package:myapp/common/widgets/button_widgets.dart';
import 'package:myapp/common/widgets/text_widgets.dart';
import 'package:myapp/pages/sign_up/sign_up_controller.dart';


import '../../common/utils/app_bar.dart';
import '../../common/utils/app_textfields.dart';
import 'notifier/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}
  class _SignUpState extends ConsumerState<SignUp>{
    late SignUpController _controller;

    @override
  void initState(){

      _controller = SignUpController(ref: ref);
      //TODO: implement initState
  super.initState();
  }




@override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    //regProvider
    final loader = ref.watch(appLoaderProvider);


    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Sign Up"),
          backgroundColor: Colors.white,
          body: loader==false?SingleChildScrollView(
            child: Column(
              children: [
                SizedBox( height: 25.h,),
                const Text14Normal(text: "Enter your details below & free sign up"),
                SizedBox(height: 50.h,),
                //email text box
                appTextField(text: "User name", iconName: ImageRes.user, hintText: "Enter your user name", func:(value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value)),
                SizedBox(height: 25.h,),

                appTextField(text: "Email", iconName: ImageRes.user, hintText: "Enter your email address", func:(value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value)),
                SizedBox(height: 25.h,),
                //password text box
                appTextField(text: "Password", iconName: ImageRes.lock, hintText: "Enter your password",func:(value)=>ref.read(registerNotifierProvider.notifier).onUserPasswordChange(value), obscureText: true ),
                SizedBox(height: 25.h,),
                //password text box
                appTextField(text: "Confirm Password", iconName: ImageRes.user, hintText: "Enter your Confirm password", func:(value)=>ref.read(registerNotifierProvider.notifier).onUserRePasswordChange(value),obscureText: true ),

                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.w, ),
                  child: const Text14Normal(text: "By creating an account you are agreeing with our terms and conditions")),
                SizedBox(
                  height: 30.h,
                ),

                //app register button
                appButton(buttonName: "Register", isLogin: true, context: context,func: ()=>_controller.handleSignUp())


              ],
            ),
          )
              : const Center(child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            color: AppColors.primaryElement,

          ),)),

      ),

    );
  }

}