import 'package:flutter/material.dart';
import 'package:flutter_portfolio/coolors.dart';
import 'package:velocity_x/velocity_x.dart';

import 'header.dart';
import 'middle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
      ]).scrollVertical(),
    );
  }
}
