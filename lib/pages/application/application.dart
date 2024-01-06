import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/utils/app_bar.dart';
import 'package:myapp/common/utils/app_colors.dart';
import 'package:myapp/common/widgets/app_shadow.dart';
import 'package:myapp/pages/application/notifier/application_nav_notifier.dart';
import 'package:myapp/pages/application/widgets/widgets.dart';


class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: appScreen(index:index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: appBoxShadowWithRadius(),
              child: BottomNavigationBar(
               currentIndex: index,
                onTap: (value){
                  ref.read(applicationNavIndexProvider.notifier).changeIndex(value);

                },
                elevation: 0,
                items: bottomTabs,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,


              ),
            )
        ),

      ),



    );
  }
  }
