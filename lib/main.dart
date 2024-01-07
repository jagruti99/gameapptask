import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_project/screens/livecasino_screen.dart';
import 'package:game_project/screens/register_screen.dart';
import 'package:game_project/screens/sport_screen.dart';
import 'package:game_project/screens/support_screen.dart';
import 'package:game_project/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    SupportScreen(),
    SportsScreen(),
    LiveCasinoScreen(),
    RegisterScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "KHELOO",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.secondaryColor),
        ),
        actions: [
          const Column(
            children: [
              Icon(
                CupertinoIcons.gift_fill,
                color: AppColors.textColor,
              ),
              Text(
                "Promotions",
                style: TextStyle(color: AppColors.textColor),
              )
            ],
          ),
          const SizedBox(width: 10),
          Container(
            color: AppColors.secondaryColor,
            height: AppBar().preferredSize.height,
            width: MediaQuery.of(context).size.width / 4,
            child: const TextButton(
              onPressed: null,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.speaker_2), label: 'Support'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.game_controller), label: 'Sports'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cube_box), label: 'Live Casino'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'Register'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: AppColors.primaryColor,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          elevation: 5),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
