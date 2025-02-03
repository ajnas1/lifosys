import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lifosys_app/utils/p_colors.dart';
import 'package:lifosys_app/utils/svgs.dart';
import 'package:lifosys_app/view/master_screen/main_screen.dart';
import 'package:lifosys_app/viewModel/master_bottom_bar_viewModel.dart';
import 'package:provider/provider.dart';

class MasterBottomBar extends StatelessWidget {
  const MasterBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterBottomBarViewmodel>(
      builder:(context, value, child) =>  Scaffold(
        backgroundColor: PColors.white3,
        bottomNavigationBar: Container(
          decoration:
              BoxDecoration(border: Border(top: BorderSide(color: PColors.grey))),
          child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle:
                    WidgetStateProperty.resolveWith<TextStyle>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return TextStyle(color: PColors.pink2);
                  }
                  return TextStyle(color: PColors.black);
                }),
              ),
              child: NavigationBar(
                backgroundColor: PColors.seed,
                selectedIndex: value.selectedIndex,
                indicatorColor: PColors.transparent,
                onDestinationSelected: (int index) {
                  Provider.of<MasterBottomBarViewmodel>(context, listen: false)
                      .onDestinationSelected(index: index);
                },
                destinations: <Widget>[
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      Svgs.dashboard,
                      colorFilter:
                          ColorFilter.mode(PColors.black, BlendMode.srcIn),
                    ),
                    selectedIcon: SvgPicture.asset(
                      Svgs.dashboard,
                      colorFilter: ColorFilter.mode(PColors.pink2, BlendMode.srcIn),
                    ),
                    label: 'dashboard',
                  ),
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      Svgs.help,
                      colorFilter: ColorFilter.mode(PColors.pink2, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Svgs.help,
                      colorFilter:
                          ColorFilter.mode(PColors.black, BlendMode.srcIn),
                    ),
                    label: 'help',
                  ),
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      Svgs.notification,
                      colorFilter: ColorFilter.mode(PColors.pink2, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Svgs.notification,
                      colorFilter:
                          ColorFilter.mode(PColors.black, BlendMode.srcIn),
                    ),
                    label: 'notification',
                  ),
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      Svgs.settings,
                      colorFilter: ColorFilter.mode(PColors.pink2, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Svgs.settings,
                      colorFilter:
                          ColorFilter.mode(PColors.black, BlendMode.srcIn),
                    ),
                    label: 'settings',
                  ),
                  NavigationDestination(
                    selectedIcon: SvgPicture.asset(
                      Svgs.logout,
                      colorFilter: ColorFilter.mode(PColors.pink2, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Svgs.logout,
                      colorFilter:
                          ColorFilter.mode(PColors.black, BlendMode.srcIn),
                    ),
                    label: 'Log out',
                  ),
                ],
              ),
            ),
          
        ),
        body: [
          MainScreen(),
          Center(
            child: Text('Help'),
          ),
          Center(
            child: Text('notification'),
          ),
          Center(
            child: Text('settings'),
          ),
          Center(
            child: Text('logout'),
          ),
        ][value.selectedIndex],
      ),
    );
  }
}
