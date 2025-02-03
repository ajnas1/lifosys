import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum HomeStatus {
  loading,
  loaded,
  error,
}

class HomeScreenViewmodel extends ChangeNotifier {
  int tabSelectedIndex = 1;

  //when user click on another tab
  // that time new index will assign
  void changeSelectedIndex({required int index}) {
    tabSelectedIndex = index;
    notifyListeners();
  }

  //  api call
  HomeStatus homestatus = HomeStatus.loading;

  Future<List<dynamic>?> fetchData(BuildContext context) async {
    var data;
    homestatus = HomeStatus.loading;
    try {
      final url = Uri.parse('');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        // return unSplashModelFromJson(response.body);
      } else {
        homestatus = HomeStatus.error;
      }
    } catch (e) {
      homestatus = HomeStatus.error;
    }

    if (data == null) {
      homestatus = HomeStatus.error;
    } else {
      homestatus = HomeStatus.loaded;
    }

    return data;
  }
}
