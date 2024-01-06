import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/utils/image_res.dart';
import 'package:myapp/common/widgets/text_widgets.dart';
import 'package:myapp/pages/welcome/widgets.dart';

import 'notifier/welcome_notifier.dart';




//final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
   Welcome({Key? key}) : super(key : key);

  final PageController _controller = PageController();

 // int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top:30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome page
                PageView(
                  onPageChanged: (value){
                    print('my index value is $value');
                      //  dotsIndex=value;
                        ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  // scrollBehavior: Axis.Direction.up
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: ImageRes.reading,
                        title: "First See Learning",
                        buttonName: "Next",
                        subTitle: "Forget about the paper, now learning all in one public", index:1, context: context
                    ),
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: ImageRes.man,
                        title: "Connect With Everyone",
                        buttonName: "Next",
                        subTitle: "Always keep in touch with your tutor and friends. Let's get connected", index:2, context:context
                    ),
                    AppOnboardingPage(
                        controller: _controller,
                        imagePath: ImageRes.boy,
                        title: "Always Fascinated Learning",
                        buttonName: "Get Started",
                        subTitle: "Always keep in touch with your tutor and friends. Let's get connected" ,index:3 ,context: context
                    ),

                  ],
                ),
                // for showing dots
                 Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator:  DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(20.0,8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w)

                      )
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
