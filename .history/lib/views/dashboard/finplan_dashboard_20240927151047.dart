import 'package:flutter/material.dart';
import 'package:test_drive/views/add%20plan/finplan_add_plan.dart';
import 'package:test_drive/views/dashboard/ticket_screen.dart';
import 'package:test_drive/views/profile/finplan_profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Include ProfileScreen and any additional screens here
  static final List<Widget> _screenList = [
    HomeScreen(),// Replace with your home screen widget
    AddPlan(), // Replace with your add plan screen widget
    FinPlanProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex], // Use selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(59, 118, 34, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}

// Example placeholder for HomeScreen and AddPlanScreen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Halo, Thalia!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add notification functionality here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/res/images/finplan_ic_no_budget.png', // Replace with your image URL
            height: 180,
            width: 180,
          ),
          const SizedBox(height: 15),
          const Text(
            'Belum Ada Rencana Anggaran',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          const Text(
            'Buat anggaran dan lihat trend pengeluaranmu sekarang!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: const Size(220, 50),
              backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Tambah Anggaran'),
          ),
        ],
      ),
      ),
    );
  }
}
