import 'package:bottom_navigation_bar/home.dart';
import 'package:bottom_navigation_bar/profile.dart';
import 'package:bottom_navigation_bar/setting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // index current page
  int currentPage = 0;

  // list pages
  final List _page = [
    const Home(),
    const Profile(),
    const Setting(),
  ];

// update bottom bar
  void _navigatorBottomBar(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Bottom Navigation Bar ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: _navigatorBottomBar,
            items: const [
              // home
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),

              // profile
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),

              // setting
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting")
            ]),
        body: _page[currentPage],
      ),
    );
  }
}
