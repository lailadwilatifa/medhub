import 'package:flutter/material.dart';
import 'package:medhub/ui/pages/home_page.dart';
import 'package:medhub/ui/pages/my_profile_page.dart';
import 'package:medhub/ui/widgets/navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomePage(),
    Center(
      child: Text('Notification'),
    ),
    Center(
      child: Text('Cart'),
    ),
    MyProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavBar(
        pageIndex: _selectedIndex,
        onTap: (index) {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
