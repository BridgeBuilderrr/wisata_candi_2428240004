import 'package:flutter/material.dart';
import 'package:joy/data/candi_data.dart';
import 'package:joy/screens/detail_screen.dart';
import 'package:joy/screens/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CandiDebugHome(),
      home: ProfileScreen(),
    );
  }
}

class CandiDebugHome extends StatefulWidget {
  const CandiDebugHome({super.key});

  @override
  State<CandiDebugHome> createState() => _CandiDebugHomeState();
}

class _CandiDebugHomeState extends State<CandiDebugHome> {
  int _selectedIndex = 0;

  void _goToPrevious() {
    setState(() {
      _selectedIndex = (_selectedIndex - 1) % candiList.length;
      if (_selectedIndex < 0) {
        _selectedIndex = candiList.length - 1;
      }
    });
  }

  void _goToNext() {
    setState(() {
      _selectedIndex = (_selectedIndex + 1) % candiList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCandi = candiList[_selectedIndex];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DetailScreen(candi: currentCandi),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _goToPrevious,
                    icon: const Icon(Icons.arrow_left),
                    label: const Text('Previous'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _goToNext,
                    icon: const Icon(Icons.arrow_right),
                    label: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
