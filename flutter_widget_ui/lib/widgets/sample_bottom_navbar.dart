import 'package:flutter/material.dart';

class SampleBottomNavBar extends StatefulWidget { // ganti ke statful
  const SampleBottomNavBar({super.key});

  @override
  State<SampleBottomNavBar> createState() => 
      _SampleBottomNavBarState();
}

class _SampleBottomNavBarState extends State<SampleBottomNavBar> {

  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Bottom Nav Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[50],
        iconSize: 30,
        showUnselectedLabels: false, // kalo ga diselect ga da labelnya
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun', 
          ),
          // Kl 4 ilang ga muncul, artinya ga muat, butuh TYPE = FIXED
        ],
      ),
    );
  }
}