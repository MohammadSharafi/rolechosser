import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../roleChooser/widgets/role_chooser_constant.dart';

class Role extends StatelessWidget {
  const Role(
      {Key? key,
      required this.opacity,
      required this.image,
      required this.size,
      required this.myrole})
      : super(key: key);

  final double opacity;
  final String image;
  final double size;
  final role myrole;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity,
        child: SvgPicture.asset(
          image,
          height:(myrole==role.GIRL)? size/2.5 : size,
        ),
      ),
    );
  }
}
