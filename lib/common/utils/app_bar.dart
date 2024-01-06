import 'package:flutter/material.dart';

import '../widgets/text_widgets.dart';
import 'app_colors.dart';

AppBar buildAppBar({String title=""}){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height:1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}
