import 'package:flutter/material.dart';
import 'package:myapp/common/utils/constrants.dart';

import '../../common/widgets/app_shadow.dart';
import '../../common/widgets/text_widgets.dart';
import '../../global.dart';
import '../sign_in/sign_in.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath ;
  final String title ;
  final String subTitle ;
  final int index ;
  final  String buttonName;
  final BuildContext context;
  const AppOnboardingPage({Key? key, required this.controller, required this.imagePath, required this.title, required this.subTitle, required this.context, required this.index, required this.buttonName}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, fit: BoxFit.fitWidth),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: text24Normal(text: title),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text16Normal(text: subTitle),
        ),
        _nextButton(index,buttonName,controller,context)
      ],
    );
  }
}


Widget appOnboardingPage(
    PageController controller,
     {String imagePath ="",
     String title = "",
       String buttonName="",
     String subTitle="", index=0, required BuildContext context}
    ){

  return  Column(
    children: [
      Image.asset(imagePath, fit: BoxFit.fitWidth),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Text16Normal(text: subTitle),
      ),
       _nextButton(index,buttonName,controller,context)
    ],
  );
}

Widget _nextButton(int index,String buttonName ,PageController controller, BuildContext context){
  return GestureDetector(
    onTap: (){
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      print("from tab $deviceFirstTime");
      if(index<3) {
        controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }else{
        //remember if we are first time or not
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, "/sign_in",);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => const SignIn(),
        //     ),
        // );
      }
    },
    child: Container(
      width: 325,
      height: 50,

      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),

      child: Center(child: Text16Normal(text: buttonName, color: Colors.white)),

    ),
  );

}