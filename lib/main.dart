import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/routes/routes.dart';
import 'package:myapp/common/services/http_util.dart';
import 'package:myapp/common/utils/app_styles.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/sign_in/sign_in.dart';
import 'package:myapp/pages/sign_up/sign_up.dart';
import 'package:myapp/pages/welcome/welcome.dart';

import 'global.dart';

Future<void> main() async {
  await Global.init();
  HttpUtil().post("api/login");
  runApp(const ProviderScope(child: MyApp()));
}

// var routesMap= {
//
//     "/":(context)=>Welcome(),
//     "/signIn":(context)=> const SignIn(),
//     "/register":(context)=> const SignUp(),
//     "/application":(context) => const Application()
//
// };
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder : (context, child) => MaterialApp(
      title: 'My App',
      theme: AppTheme.appThemeData,
     // routes: routesMap,
     // onGenerateRoute: ()=>RandomeFunction(),
      // home: Welcome(),
          onGenerateRoute: AppPages.generateRouteSettings,
    )
    );
  }
}

final appCount = StateProvider<int>((ref){
  return 3;
});