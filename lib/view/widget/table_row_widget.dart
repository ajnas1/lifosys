import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifosys_app/utils/svgs.dart';

import '../../utils/p_colors.dart';
import 'center_table_row_element_text.dart';

TableRow tableRowWidget({required bool isMobile}) {
  return TableRow(decoration: BoxDecoration(color: PColors.seed), children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(Svgs.tick,height: 25,width: 25,),
        ),
        SizedBox(
            height: 60,
            child: VerticalDivider(
              color: PColors.grey3,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(Svgs.close,height: 25,width: 25,),
        ),
      ],
    ),
    centerTableRowElementText(title: "16"),
    if (!isMobile) centerTableRowElementText(title: "32"),
    if (!isMobile) centerTableRowElementText(title: "Female"),
    if (!isMobile) centerTableRowElementText(title: "Darlene Robertson"),
    centerTableRowElementText(title: "Kathryn Murphy"),
    if (!isMobile) centerTableRowElementText(title: "ID: 39635"),
  ]);
}
