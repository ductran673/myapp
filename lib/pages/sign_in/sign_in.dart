import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/global_loader/global_loader.dart';
import 'package:myapp/common/utils/image_res.dart';
import 'package:myapp/common/widgets/button_widgets.dart';
import 'package:myapp/common/widgets/text_widgets.dart';
import 'package:myapp/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:myapp/pages/sign_in/sign_in_controller.dart';
import 'package:myapp/pages/sign_in/sign_in_widgets.dart';

import '../../common/utils/app_colors.dart';
import '../../common/utils/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {

  late SignInController _controller;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0),(){
    _controller = SignInController(ref);
    });
    super.initState();
    }
    @override
  void didChangeDependencies() {
     // Future.delayed(Duration(seconds: 0),(){
        _controller = SignInController(ref);
     // });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    print(signInProvider.password);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: loader==false?SingleChildScrollView(
            child: Column(
              children: [
                thirdPartyLogin(),
                const Text14Normal(text: "Or use your email account to login"),
                SizedBox(height: 50.h,),
                //email text box
                appTextField( controller: _controller.emailController,text: "Email", iconName: ImageRes.user, hintText: "Enter your email address", func:(value)=>ref.read(signInNotifierProvider.notifier).onUserEmailChange(value) ),
                SizedBox(height: 25.h,),
                //password text box
                appTextField(controller: _controller.passwordController,text: "Password", iconName: ImageRes.lock, hintText: "Enter your password", obscureText: true,  func:(value)=>ref.read(signInNotifierProvider.notifier).onUserPasswordChange(value) ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 200.w),
                  child: textUnderline(text: "Forget password?")),
                SizedBox(
                  height: 80.h,
                ),
                //app login button
                appButton(buttonName: "Login", func: ()=>_controller.handleSignIn()),
                SizedBox(
                  height: 10.h,
                ),
                //app register button
                appButton(buttonName: "Register", isLogin: false, context: context, func: ()=>Navigator.pushNamed(context, "/register"))


              ],
            ),
          )
        : const Center(child: CircularProgressIndicator(
         backgroundColor: Colors.blue,
         color: AppColors.primaryElement,
        ),
    ) ),
      ),
    );
  }
}
