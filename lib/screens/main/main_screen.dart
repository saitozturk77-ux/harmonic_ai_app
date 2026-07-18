import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../signals/signals_screen.dart';
import '../scanner/scanner_screen.dart';
import '../ai/ai_screen.dart';
import '../settings/settings_screen.dart';
import '../../widgets/drawer/app_drawer.dart';

import '../home/widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = const [
      HomeScreen(),
      SignalsScreen(),
      ScannerScreen(),
      AIScreen(),
      SettingsScreen(),
    ];
  }

  void _changePage(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: const SizedBox.shrink(),
        centerTitle: false,
      ),

      drawer: const AppDrawer(),

      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _changePage,
      ),
    );
  }
}