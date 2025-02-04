import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Widget getNavIcon({
  required String icon,
  required Color color
}) {
  return SvgPicture.asset(
    icon,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}
