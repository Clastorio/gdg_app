import 'package:flutter/material.dart';
import 'package:gdg_app/screens/faq_screen.dart';
import 'package:gdg_app/screens/home_screen.dart';
import 'package:gdg_app/screens/event_screen.dart';
import 'package:gdg_app/screens/resources_screen.dart';
import 'package:gdg_app/screens/teams_screen.dart';
import 'package:gdg_app/widgets/drawer_widget.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int bottomNavigationBarIndex = 0;
  Widget currentScreen = const HomeScreen();

  Widget appBarTitle = Image.asset(
    height: 25,
    width: 100,
    fit: BoxFit.contain,
    'lib/assets/gdg_logo.png',
  );
  void changeScreen(int index) {
    setState(() {
      bottomNavigationBarIndex = index;
    });
    switch (index) {
      case 0:
        bottomNavigationBarIndex = 0;
        currentScreen = const HomeScreen();
        appBarTitle = Image.asset(
    height: 25,
    width: 100,
    fit: BoxFit.contain,
    'lib/assets/gdg_logo.png',
  );
        break;
      case 1:
        bottomNavigationBarIndex = 1;
        currentScreen = const EventScreen();
        appBarTitle = const Text("Event");
        break;
      case 2:
        bottomNavigationBarIndex = 2;
        currentScreen = const ResourcesScreen();
        break;
      case 3:
        bottomNavigationBarIndex = 3;
        currentScreen = const TeamsScreen();

        break;
      case 4:
        bottomNavigationBarIndex = 4;
        currentScreen = const FAQScreen();
        break;

      default:
        bottomNavigationBarIndex = 0;
        currentScreen = const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: appBarTitle),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: changeScreen,
        currentIndex: bottomNavigationBarIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Resources",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: "Team",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support_outlined),
            label: "FAQ",
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: currentScreen,
    );
  }
}
