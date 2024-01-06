import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/sign_up/notifier/register_notifier.dart';

import '../widgets/app_shadow.dart';
import '../widgets/image_widgets.dart';
import '../widgets/text_widgets.dart';

Widget appTextField({TextEditingController? controller,String text="",String iconName="", String hintText ="Type", bool obscureText = false,  void Function(String value)? func}){
  return Container(
    padding: EdgeInsets.only(left: 15.w,right: 15.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(height: 5.h,),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxShadowTextField(),
          // row chua bieu tuong va truong ki tu
          child: Row(
            children: [
              // de show bieu tuong
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              //text field
              appTextFieldOnly(controller: controller, hintText: hintText, func: func,obscureText: obscureText),
            ],
          ),
        )
      ],
    ),

  );
}

Widget appTextFieldOnly ({TextEditingController? controller,String hintText="Type in your info", double width=280, double height=50, void Function(String value)? func, bool obscureText = false}){
  return SizedBox(
    width: width.w,
    height: height.h,
    child:  TextField(

      controller: controller,
      onChanged:(value)=>func!(value),

      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.h, left: 10.w),
        hintText : hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            )
        ),
        //vien mac dinh khi chua nhap vao
        enabledBorder:   const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            )
        ),

        focusedBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            )
        ),

        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            )
        ),

      ),

      maxLines: 1,
      autocorrect: false,
      // de mac dinh la false
      obscureText: obscureText,
    ),
  );
}