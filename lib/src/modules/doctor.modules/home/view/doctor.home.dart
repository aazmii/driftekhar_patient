import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/settings/view/doctor.account.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/view/appointments.view.dart';
import 'package:flutter/material.dart';

class DoctorApp extends StatefulWidget {
  const DoctorApp({super.key});

  @override
  State<DoctorApp> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorApp> {
  int _selectedIndex = 0;
  // To keep track of selected tab
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    DoctorHome(),
    DoctorSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment',
          style: context.text.titleLarge!.copyWith(
            color: context.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
