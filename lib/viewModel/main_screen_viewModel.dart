import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lifosys_app/model/patientModel.dart';

enum MainStatus {
  loading,
  loaded,
  error,
}

class MainScreenViewmodel extends ChangeNotifier {
  int tabSelectedIndex = 1;

  //when user click on another tab
  // that time new index will assign
  void changeSelectedIndex({required int index}) {
    tabSelectedIndex = index;
    notifyListeners();
  }

  MainStatus mainstatus = MainStatus.error;
  //  this function call the api and convert the json into dart object
  Future<PatientModel?> fetchData() async {
    try {
      final url = Uri.parse('${dotenv.env['APIENDPOINT']}');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${dotenv.env['ACCESSTOKEN']}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );

      if (response.statusCode == 200) {
        print('fsdhijfsdj');
        final data = PatientModel.fromJson(jsonDecode(response.body));
        mainstatus = MainStatus.loaded;
        return data;
      } else {
        mainstatus = MainStatus.error;
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      mainstatus = MainStatus.error;
      print('Exception occurred: $e');
      return null;
    }
  }
}
