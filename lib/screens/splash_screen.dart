import 'package:eco_app/config/size_config.dart';
import 'package:eco_app/screens/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ScreenBody(),
    );
  }
}
