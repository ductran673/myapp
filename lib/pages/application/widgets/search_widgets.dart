import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/utils/app_colors.dart';
import 'package:myapp/common/utils/app_textfields.dart';
import 'package:myapp/common/widgets/app_shadow.dart';
import 'package:myapp/common/widgets/image_widgets.dart';

import '../../../common/utils/image_res.dart';

Widget searchBar(){
  return Row(children: [
    //search text box
 Container(
   width: 280.w,
   height: 40.h,
   decoration: appBoxShadow(color: AppColors.primaryBackground,
       boxBorder: Border.all(color: AppColors.primaryFourthElementText)),
   child: Row(
     children: [
       Container(
         margin: EdgeInsets.only(left: 17.w),
       child: appImage(imagePath: ImageRes.searchIcon),

       ),
       Container(
         width: 240.w,
         height: 40.h,
         child: appTextFieldOnly(width: 240, height: 40, hintText: "Search your couse..."),
       )
     ],
   ),
 ),
    //search button
    GestureDetector(
      child: Container(

        padding: EdgeInsets.all(5.w),
        width: 30.w,
        height: 30.h,
        decoration: appBoxShadow(
          boxBorder: Border.all(color: AppColors.primaryElement)
        ),
        child: appImage(imagePath: ImageRes.searchButton),

      ),
    )

  ],);
}