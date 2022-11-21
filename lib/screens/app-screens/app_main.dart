import 'package:eventrate/features/app-features/shared/controller/shared_controller.dart';
import 'package:eventrate/screens/app-screens/add-event/add_event_screen.dart';
import 'package:eventrate/screens/app-screens/events/event-list/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Keşfet',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.face),
        label: 'Profil',
      ),
    ];

    List<Widget> widgetOptions = <Widget>[
      const HomeScreen(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];

    final SharedController sharedController = Get.put(SharedController());
    return GetX<SharedController>(
      init: SharedController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddEventScreen());
            },
            child: const Icon(
              Icons.add,
              size: 32,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: sharedController.currentTabIndex.value,
            onTap: (value) {
              sharedController.currentTabIndex.value = value;
            },
            items: bottomNavBarItems,
          ),
          body: widgetOptions.elementAt(controller.currentTabIndex.value),
        );
      },
    );
  }
}
