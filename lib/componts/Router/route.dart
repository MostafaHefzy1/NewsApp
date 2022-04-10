import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/settings.dart';

import 'consts.dart';

class specialRoute {

  static Route? genratetoscreen(RouteSettings settings) {
    switch (settings.name) {
      case setting:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
    }
  }
}