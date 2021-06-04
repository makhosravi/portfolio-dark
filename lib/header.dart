import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_portfolio/coolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameWidget =
        'MAKH'.text.white.xl6.lineHeight(1).size(context.isMobile ? 15 : 20).bold.make().shimmer();
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
                        if (context.isMobile) 50.heightBox else 10.heightBox,
                        CustomAppBar().shimmer(
                          primaryColor: Coolors.accentColor,
                        ),
                        30.heightBox,
                        nameWidget,
                        20.heightBox,
                        VxBox().color(Coolors.accentColor).size(60, 10).make().shimmer(
                              primaryColor: Coolors.accentColor,
                            ),
                        30.heightBox,
                        SocialAccount(),
                      ],
                    ).pSymmetric(h: context.percentWidth * 10, v: 32),
                    Expanded(
                      child: VxResponsive(
                        fallback: const Offstage(),
                        small: IntroductionWidget().pOnly(left: 120).h(context.percentHeight * 60),
                        medium: IntroductionWidget().pOnly(left: 120).h(context.percentHeight * 60),
                        large: IntroductionWidget().pOnly(left: 120).h(context.percentHeight * 60),
                      ),
                    ),
                  ],
                ).w(context.screenWidth),
              ],
            ),
          ],
        ),
      ).size(context.screenWidth, context.percentHeight * 60).color(Coolors.secondaryColor).make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          ' - Introduction'.text.gray500.widest.sm.make(),
          10.heightBox,
          ' A Google developer for flutter, native kotlin & also beginner in IoT and web. \nLots of energy and ambition. Ready to conquer the world of technology.'
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile ? context.screenWidth : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        ElevatedButton(
          onPressed: () {
            launch('https://google.com');
          },
          child: 'Visit google.com'.text.make(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Coolors.accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) return Vx.purple700;
              return null;
            }),
          ),
        ).h(50),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
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

class SocialAccount extends StatelessWidget {
  const SocialAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch('https://twitter.com/');
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch('https://instagram.com');
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.youtube,
        color: Colors.white,
      ).mdClick(() {
        launch('https://youtube.com');
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch('https://github.com');
      }).make(),
    ].hStack();
  }
}
