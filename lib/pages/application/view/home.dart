import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myapp/pages/application/controller/home_controller.dart';
import 'package:myapp/pages/application/widgets/home_widget.dart';
import 'package:myapp/pages/application/widgets/search_widgets.dart';


import '../../../common/utils/app_bar.dart';



class Home extends ConsumerStatefulWidget {
  const Home({Key? key}): super(key: key);
  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>{
 late PageController _controller ;

 @override
  void didChangeDependencies() {
   _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: homeAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h,),
              searchBar(),
              SizedBox(height: 20.h,),
              HomeBanner(ref:ref,controller: _controller),
              const HomeMenuBar(),
              const CourseItemGrid(),
            ],
          ),
        ),
      ),
    );
  }


}
