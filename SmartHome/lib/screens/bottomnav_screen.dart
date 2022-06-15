import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirst/controllers/BottomNavigationController.dart';
import 'package:myfirst/screens/home_screen.dart';
import 'package:myfirst/screens/settings_screen.dart';
import 'package:myfirst/screens/temperature_screen.dart';
import 'package:myfirst/screens/lights_screen.dart';

import 'myprofile_screen.dart';



class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);
  static const String id = 'bottomnav_screen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: IndexedStack(
                index: 0,
                children: [
                  [
                    HomeScreen(),
                    TemperatureScreen(),
                    LightsScreen(),
                    SettingsScreen(),
                    // MyProfileScreen(),
                  ][controller.index]
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.index,
                onTap: controller.setIndex,
                selectedLabelStyle: TextStyle(fontSize: 1),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.wb_sunny_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.light),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
