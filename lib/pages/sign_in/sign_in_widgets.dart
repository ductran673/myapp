import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/utils/app_colors.dart';
import 'package:myapp/common/widgets/app_shadow.dart';
import 'package:myapp/common/widgets/image_widgets.dart';
import 'package:myapp/common/widgets/text_widgets.dart';

AppBar buildAppBar(){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height:1,
      ),
    ),
    title: Text16Normal(text: "Login", color: AppColors.primaryText),
  );
}

Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),

      ],
    ),
  );
}

Widget _loginButton(String imagePath){
  return GestureDetector(
    onTap: (){

    },
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

// Widget appTextField({TextEditingController? controller,String text="",String iconName="", String hintText ="Type", bool obscureText = false,  void Function(String value)? func}){
//   return Container(
//     padding: EdgeInsets.only(left: 25.w,right: 25.w),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         text14Normal(text: text),
//         SizedBox(height: 5.h,),
//         Container(
//           width: 325.w,
//           height: 50.h,
//           decoration: appBoxShadowTextField(),
//           // row chua bieu tuong va truong ki tu
//           child: Row(
//             children: [
//               // de show bieu tuong
//               Container(
//                 margin: EdgeInsets.only(left: 17.w),
//                 child: appImage(imagePath: iconName),
//               ),
//               //text field
//               Container(
//                 width: 250.w,
//                 height: 50.h,
//                 child:  TextField(
//                   controller: controller,
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                   hintText : hintText,
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.transparent
//                       )
//                     ),
//                     //vien mac dinh khi chua nhap vao
//                     enabledBorder:   const OutlineInputBorder(
//                   borderSide: BorderSide(
//                   color: Colors.transparent
//                   )
//                 ),
//
//                     focusedBorder:  const OutlineInputBorder(
//                   borderSide: BorderSide(
//                   color: Colors.transparent
//                   )
//                 ),
//
//                     disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                   color: Colors.transparent
//                   )
//                 ),
//
//                   ),
//                   onChanged:(value)=>func!(value),
//                   maxLines: 1,
//                   autocorrect: false,
//                   // de mac dinh la false
//                   obscureText: obscureText,
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//
//   );
// }