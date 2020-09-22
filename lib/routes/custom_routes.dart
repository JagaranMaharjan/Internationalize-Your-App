import 'package:flutter/material.dart';
import 'package:flutter_localization/pages/about_page.dart';
import 'package:flutter_localization/pages/home_page.dart';
import 'package:flutter_localization/pages/not_found_page.dart';
import 'package:flutter_localization/pages/settings_page.dart';
import 'package:flutter_localization/routes/route_names.dart';

class CustomRoutes {
  //when we are navigating from one page to another, this method will be called
  //and pass setting, by manipulating this setting, navigate the screen
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
