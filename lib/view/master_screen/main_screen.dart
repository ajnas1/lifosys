import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lifosys_app/utils/p_colors.dart';
import 'package:lifosys_app/utils/p_images.dart';
import 'package:lifosys_app/utils/p_textstyle.dart';
import 'package:lifosys_app/utils/svgs.dart';
import 'package:lifosys_app/view/widget/get_icon_widget.dart';
import 'package:lifosys_app/viewModel/main_screen_viewModel.dart';
import 'package:provider/provider.dart';

import '../home/checkin_screen.dart';
import '../widget/search_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this, initialIndex: 1);
    tabController.addListener(() {
      Provider.of<HomeScreenViewmodel>(context, listen: false)
          .changeSelectedIndex(index: tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        Provider.of<HomeScreenViewmodel>(context).tabSelectedIndex;
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        bool isMobile = screenWidth < 600 ? true : false;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: PColors.seed,
                  border: Border(bottom: BorderSide(color: PColors.grey))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: isMobile? 60: 40, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          PImages.appLogo,
                          width: isMobile?80:115,
                          height: 40,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: searchBar(context)),
                        Container(
                          height: 44,
                          width: isMobile? 60:88,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: PColors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SvgPicture.asset(
                                  Svgs.menu,
                                  colorFilter: ColorFilter.mode(
                                      PColors.black4, BlendMode.srcIn),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: PColors.black,
                                  child: Text(
                                    'A',
                                    style: PTextstyle.titleLarge
                                        .copyWith(color: PColors.seed),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: isMobile?Alignment.centerLeft: Alignment.center,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          tabAlignment: isMobile? TabAlignment.start:null,
                          isScrollable:isMobile? true:false,
                          controller: tabController,
                          dividerHeight: 0,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          unselectedLabelColor: PColors.grey2,
                          tabs: [
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.home,
                                    index: 0,
                                    selectedIndex: selectedIndex),
                                text: 'Home'),
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.checkIn,
                                    index: 1,
                                    selectedIndex: selectedIndex),
                                text: 'Check In'),
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.doctor,
                                    index: 2,
                                    selectedIndex: selectedIndex),
                                text: 'Doctors'),
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.nurse,
                                    index: 3,
                                    selectedIndex: selectedIndex),
                                text: 'Nurses'),
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.employees,
                                    index: 4,
                                    selectedIndex: selectedIndex),
                                text: 'Employees'),
                            Tab(
                                icon: getIcon(
                                    icon: Svgs.patient,
                                    index: 5,
                                    selectedIndex: selectedIndex),
                                text: 'Patients'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  [
                  const Center(child: const Text('Home')),
                  CheckinScreen(isMobile: isMobile,),
                  const Center(child: Text('Doctors')),
                  const Center(child: Text('Nurses')),
                  const Center(child: Text('Employees')),
                  const Center(child: Text('Patients')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
    }
  