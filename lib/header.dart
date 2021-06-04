import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_portfolio/coolors.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: VxBox(
      child: VStack(
        [
          ZStack(
            [
              PictureWidget(),
              Row(
                children: [
                  VStack(
                    [
                      CustomAppBar().shimmer(
                        primaryColor: Coolors.accentColor,
                      ),
                      30.heightBox,
                      'MAKH'
                          .text
                          .white
                          .xl6
                          .lineHeight(1)
                          .size(context.isMobile ? 15 : 20)
                          .bold
                          .make(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).make());
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/pic.png',
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}
