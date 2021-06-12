import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          'All creative Works.\n'
              .richText
              .withTextSpanChildren(
                [
                  'Selected projects.'.textSpan.yellow400.make(),
                ],
              )
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(title: 'Frontier Wallet'),
                ProjectWidget(title: 'Click2Chat'),
                ProjectWidget(title: 'Ready0'),
                ProjectWidget(title: 'Payoye'),
                ProjectWidget(title: 'QArt Fashion'),
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayInterval: 2.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, @required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return title!.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(
          color: Vx.purple700,
          elevation: 5.0,
          curve: VxCurve.flat,
        )
        .make()
        .p16();
  }
}
