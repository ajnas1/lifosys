import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifosys_app/utils/p_colors.dart';
import 'package:lifosys_app/utils/p_textstyle.dart';
import 'package:lifosys_app/utils/svgs.dart';

Container searchBar(BuildContext context) {
  return Container(
    height: 55,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: PColors.seed,
      border: Border.all(color: PColors.white),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(50),
    ),
    child: SearchBar(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(PColors.seed),
        leading: Container(
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: PColors.pink,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              Svgs.search,
              height: 20,
              width: 20,
            )),
        hintText: "Search for a patient or add a new one",
        hintStyle: WidgetStateProperty.all(
            PTextstyle.titleMedium.copyWith(color: PColors.black3))),
  );
}
