import 'package:flutter/material.dart';

class MasterBottomBarViewmodel extends ChangeNotifier{

  int selectedIndex = 0;

  //when user click on another navigation 
  //destination that time new destination index will assign
  void onDestinationSelected({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  
}