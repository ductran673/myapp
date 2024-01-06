import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/routes/app_routes_names.dart';
import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/application/view/home.dart';
import 'package:myapp/pages/sign_in/sign_in.dart';
import 'package:myapp/pages/sign_up/sign_up.dart';
import 'package:myapp/pages/welcome/welcome.dart';

import '../../global.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesName.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesName.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesName.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesName.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesName.HOME, page: const Home()),

    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    // print ("my route name is ${settings.name}");
    if (kDebugMode) {
    //  print("clicked route is ${settings.name}");
    }

    if (settings.name != null) {


      var result = routes().where((element) => element.path == settings.name);
      if(result.isNotEmpty){
    // if we used this is first time or not
        bool deviceFirstTime= Global.storageService.getDeviceFirstOpen();

      if (result.first.path == AppRoutesName.WELCOME&&deviceFirstTime) {
        bool isLoggedIn = Global.storageService.isLoggedIn();
        if(isLoggedIn){
          return MaterialPageRoute(
              builder: (_) => const Application(),
              settings: settings);
        }else {
          return MaterialPageRoute(
              builder: (_) => const SignIn(),
              settings: settings);
        }
      } else {
        if (kDebugMode) {
          print('App ran first time');
        }
        return MaterialPageRoute(builder: (_) => result.first.page,
            settings: settings
        );
        }
      }
    }
      return MaterialPageRoute(
          builder: (_) => Welcome(),
          settings: settings);
    }
  }

  class RouteEntity{
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
  }

