import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/p_colors.dart';

Widget getIcon({required String icon, required int index, required int selectedIndex}) {
  print(selectedIndex);
  return SvgPicture.asset(
    icon,
    height: 24,
    width: 24,
    colorFilter: ColorFilter.mode(index == selectedIndex? PColors.black: PColors.grey2, BlendMode.srcIn),
  );
}
