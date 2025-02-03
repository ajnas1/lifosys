import 'package:flutter/material.dart';
import 'package:lifosys_app/utils/p_images.dart';
import 'package:lifosys_app/view/widget/center_table_heading_row_text.dart';
import 'package:lifosys_app/view/widget/checkin_status_widget.dart';
import 'package:lifosys_app/view/widget/table_row_widget.dart';

import '../../utils/p_colors.dart';

class CheckinScreen extends StatelessWidget {
  const CheckinScreen({super.key, required this.isMobile});
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: PColors.white3,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08),
              child: Row(
                children: [
                  Expanded(
                      child: checkInStatusWidget(
                          isMobile: isMobile,
                          context: context,
                          icon: PImages.appoiments,
                          title: 'Appoiments',
                          data: '650')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                      child: checkInStatusWidget(
                          isMobile: isMobile,
                          context: context,
                          icon: PImages.completed,
                          title: 'Completed',
                          data: '400')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                      child: checkInStatusWidget(
                          isMobile: isMobile,
                          context: context,
                          icon: PImages.pending,
                          title: 'Pending',
                          data: '100')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                      child: checkInStatusWidget(
                          isMobile: isMobile,
                          context: context,
                          icon: PImages.canceled,
                          title: 'Canceled',
                          data: '50')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08),
              child: Table(
                textDirection: TextDirection.rtl,
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                border: TableBorder.all(
                    width: 1.0,
                    color: PColors.grey3,
                    borderRadius: BorderRadius.circular(8)),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: PColors.seed),
                    children: [
                      centerTableHeadingRowText(title: "Check in"),
                      centerTableHeadingRowText(title: "Token no"),
                      if (!isMobile) centerTableHeadingRowText(title: "Age"),
                      if (!isMobile) centerTableHeadingRowText(title: "Genter"),
                      if (!isMobile) centerTableHeadingRowText(title: "Doctor"),
                      centerTableHeadingRowText(title: "Patient name"),
                      if (!isMobile)
                        centerTableHeadingRowText(title: "Patient id"),
                    ],
                  ),
                  ...List.generate(
                      20, (index) => tableRowWidget(isMobile: isMobile)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
