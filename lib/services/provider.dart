import 'package:lifosys_app/viewModel/master_bottom_bar_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewModel/main_screen_viewModel.dart';

final List<SingleChildWidget> provider = [
  ChangeNotifierProvider(create: (context) => MasterBottomBarViewmodel()),
  ChangeNotifierProvider(create: (context) => MainScreenViewmodel()),
];
