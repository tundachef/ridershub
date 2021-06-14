import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ridershub/views/chats.dart';
import 'package:ridershub/views/colors.dart';
import 'package:ridershub/views/history.dart';
import 'package:ridershub/views/orders.dart';
import 'package:ridershub/views/status.dart';

import 'views/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'RidersHub',
      theme: ThemeData(
          fontFamily: 'ProximaNova', scaffoldBackgroundColor: SCAFFOLD_BG),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: ChatsPage(),
    );
  }
}

// VIP CLASS DON'T TAMPER!!!!!
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
