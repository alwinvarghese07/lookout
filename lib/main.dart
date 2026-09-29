import 'package:flutter/material.dart';
import 'home_page.dart';
import 'report_page.dart';
import 'account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'System Analytics App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return Colors.grey;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color>((states) {
            return Colors.white;
          }),
          trackOutlineColor: MaterialStateProperty.resolveWith<Color>((states) {
            return Colors.black;
          }),
          trackOutlineWidth: MaterialStateProperty.all(1.0),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      home: const AnalyticsScreen(), // Start with AnalyticsScreen
    );
  }
}

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    ReportPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/home_icon.png'), size: 32),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/report_icon.png'), size: 32),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/account_icon.png'), size: 32),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: const Color.fromARGB(255, 20, 20, 20),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 15,
          unselectedFontSize: 14,
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
        ),
      ),
    );
  }
}