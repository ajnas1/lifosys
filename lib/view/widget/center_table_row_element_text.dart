import 'package:flutter/material.dart';

import '../../utils/p_colors.dart';
import '../../utils/p_textstyle.dart';

Widget centerTableRowElementText({required String title,}) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PTextstyle.titleSmall.copyWith(
            color: PColors.black,
          ),
        ),
      ),
    ),
  );
}
