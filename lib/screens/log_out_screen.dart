import 'package:flutter/material.dart';
import 'package:log_in_form_flutter/screens/fitness%20screens/fitness_screen.dart';
import 'package:log_in_form_flutter/screens/travel_screen.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: () {
        switch (_selectedIndex) {
          case 0:
            return const Home();
          case 1:
            return const BmiScreen();
          case 2:
            return const Center(child: Text('school'));
          case 3:
            return const Center(child: Text('settings'));

          default:
        }
      }(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active_outlined),
            label: 'Travel',
            backgroundColor: Color.fromARGB(255, 0, 61, 153),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.yellow,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const Spacer(flex: 1),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Center(
      //           child: _widgetOptions.elementAt(_selectedIndex),
      //         ),
      //       ),

      //       // const Spacer(flex: 1),
      //       // Expanded(
      //       //   child: Align(
      //       //     alignment: Alignment.bottomCenter,
      //       //     child: BottomNavigationBar(
      //       //       items: const <BottomNavigationBarItem>[
      //       //         BottomNavigationBarItem(
      //       //           icon: Icon(Icons.home),
      //       //           label: 'Home',
      //       //           backgroundColor: Colors.red,
      //       //         ),
      //       //         BottomNavigationBarItem(
      //       //           icon: Icon(Icons.business),
      //       //           label: 'Business',
      //       //           backgroundColor: Colors.green,
      //       //         ),
      //       //         BottomNavigationBarItem(
      //       //           icon: Icon(Icons.school),
      //       //           label: 'School',
      //       //           backgroundColor: Colors.purple,
      //       //         ),
      //       //         BottomNavigationBarItem(
      //       //           icon: Icon(Icons.settings),
      //       //           label: 'Settings',
      //       //           backgroundColor: Colors.yellow,
      //       //         ),
      //       //       ],
      //       //       currentIndex: _selectedIndex,
      //       //       selectedItemColor: Colors.white,
      //       //       onTap: _onItemTapped,
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
