import 'package:flutter/material.dart';
import 'package:lifosys_app/utils/p_colors.dart';
import 'package:lifosys_app/utils/svgs.dart';
import 'package:lifosys_app/view/master_screen/main_screen.dart';
import 'package:lifosys_app/viewModel/master_bottom_bar_viewModel.dart';
import 'package:provider/provider.dart';

import '../widget/get_nav_icon.dart';

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
                    icon: getNavIcon(icon: Svgs.dashboard,color: PColors.black),
                    selectedIcon: getNavIcon(icon: Svgs.dashboard,color: PColors.pink2),
                    label: 'dashboard',
                  ),
                  NavigationDestination(
                    selectedIcon: getNavIcon(icon: Svgs.help,color: PColors.pink2),
                    icon: getNavIcon(icon: Svgs.help,color: PColors.black),
                    label: 'help',
                  ),
                  NavigationDestination(
                    selectedIcon: getNavIcon(icon: Svgs.notification,color: PColors.pink2),
                    icon: getNavIcon(icon: Svgs.notification,color: PColors.black),
                    label: 'notification',
                  ),
                  NavigationDestination(
                    selectedIcon: getNavIcon(icon: Svgs.settings,color: PColors.pink2),
                    icon: getNavIcon(icon: Svgs.settings,color: PColors.black),
                    label: 'settings',
                  ),
                  NavigationDestination(
                    selectedIcon: getNavIcon(icon: Svgs.logout,color: PColors.pink2),
                    icon: getNavIcon(icon: Svgs.logout,color: PColors.black),
                    label: 'Log out',
                  ),
                ],
              ),
            ),
          
        ),
        body: [
          const MainScreen(),
          const Center(
            child: Text('Help'),
          ),
          const Center(
            child: Text('notification'),
          ),
          const Center(
            child: Text('settings'),
          ),
          const Center(
            child: Text('logout'),
          ),
        ][value.selectedIndex],
      ),
    );
  }
}
