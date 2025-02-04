import 'package:flutter/material.dart';
import 'package:lifosys_app/utils/p_colors.dart';
import 'package:lifosys_app/utils/p_textstyle.dart';

Widget checkInStatusWidget(
    {required BuildContext context,
    required String icon,
    required String title,
    required String data,
    required bool isMobile}) {
      print(isMobile);
  return Container(
    decoration: BoxDecoration(
        color: PColors.seed,
        boxShadow: [
          BoxShadow(
            color: PColors.black5,
            offset: const Offset(0, 4),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(color: PColors.white2),
        borderRadius: BorderRadius.circular(16)),
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset(icon,height: isMobile?30:48,width: isMobile?30:48,),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: PTextstyle.titleMedium
                    .copyWith(color: PColors.black, fontSize: 16,overflow: TextOverflow.ellipsis,),maxLines: 1,
              ),
              Text(data,style:  PTextstyle.headlineLarge
                    .copyWith(color: PColors.black, fontSize: 20,overflow: TextOverflow.ellipsis,),maxLines: 1,)
            ],
          ),
        )
      ],
    ),
  );
}
