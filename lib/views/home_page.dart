import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:terrasoft/controllers/home_controller.dart';
import 'package:terrasoft/helpers/widget_helper.dart';
import 'package:terrasoft/views/bottom_app_bar/assets.dart';
import 'package:terrasoft/views/bottom_app_bar/dashboard.dart';
import 'package:terrasoft/views/bottom_app_bar/observers.dart';
import 'package:terrasoft/views/bottom_app_bar/teams.dart';
import 'package:terrasoft/widgets/tabbar_material_widget.dart';
import 'bottom_app_bar/notifications.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _controllerHome = Get.put(HomeController());

  // Bottom App Bar Pages List
  final pages = <Widget>[
    const Dashboard(),
    Teams(),
    const Observers(),
    const Assets(),
    const Notifications(),
  ];
  // App Bar Page Titles List
  final title = <String>[
    'Dashboard',
    'Teams',
    'Observers',
    'Assets',
    'Notifications',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: WidgetHelper().buildAppBar(title[_controllerHome.index.value]),
      bottomNavigationBar: TabBarMaterialWidget(
        index: _controllerHome.index.value,
        onChangedTab: onChangedTab,
      ),
      body: pages[_controllerHome.index.value],
    ));
  }

  // Change Bottom App Bar Pages[index]
  void onChangedTab(int index) {
      _controllerHome.index.value = index;
  }
}
