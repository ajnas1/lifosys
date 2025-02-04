import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifosys_app/utils/svgs.dart';

import '../../model/patientModel.dart';
import '../../utils/p_colors.dart';
import 'center_table_row_element_text.dart';

TableRow tableRowWidget({required bool isMobile,required int index,required Datum data}) {
  return TableRow(decoration: BoxDecoration(color:index.isEven? PColors.grey4:PColors.seed), children: [
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
    centerTableRowElementText(title: '${data.tokenNo}'),
    if (!isMobile) centerTableRowElementText(title: data.departments),
    if (!isMobile) centerTableRowElementText(title: '${data.consultationCharge}'),
    if (!isMobile) centerTableRowElementText(title: data.doctor),
    centerTableRowElementText(title: data.patientName),
    if (!isMobile) centerTableRowElementText(title: "ID: ${data.id}"),
  ]);
}
