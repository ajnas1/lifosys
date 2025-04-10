import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lifosys_app/services/provider.dart';
import 'package:lifosys_app/view/master_screen/master_bottom_bar.dart';
import 'package:provider/provider.dart';

void main() async {
 await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
      providers: provider,
      child: const MyApp(),
    ),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MasterBottomBar()
    );
  }
}
