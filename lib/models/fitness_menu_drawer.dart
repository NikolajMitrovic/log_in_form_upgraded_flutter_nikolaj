import 'package:flutter/material.dart';
import 'package:log_in_form_flutter/screens/fitness%20screens/fitness_screen.dart';
import 'package:log_in_form_flutter/screens/fitness%20screens/fitness_weather_screen.dart';
import 'package:log_in_form_flutter/screens/fitness%20screens/sessions_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = ['BMI Calculator', 'Weather', 'Training'];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Fitness',
          style: TextStyle(color: Colors.white, fontSize: 28),
        )));
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: const TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'BMI Calculator':
                screen = const BmiScreen();
                break;
              case 'Weather':
                screen = const WeatherScreen();
                break;
              case 'Training':
                screen = const SessionsScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
          }));
    }
    return menuItems;
  }
}
