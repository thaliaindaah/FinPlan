import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_drive/views/add plan/finplan_add_plan.dart';
import 'package:test_drive/views/profile/finplan_profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static List<Widget> _screenList = [];

  @override
  void initState() {
    super.initState();
    _loadStoredUserData(); // Load stored string on initialization
  }

 Future<void> _loadStoredUserData() async {
  Map<String, String?> userData = await getUserPreferences();
  setState(() {
    String name = userData['name'] ?? 'No name stored';
    String email = userData['email'] ?? 'No email stored';

    // Update the screen list with the latest stored values
    _screenList = [
      HomeScreen(storedValue: name), // Pass the name to HomeScreen
      AddPlan(), // Your add plan screen widget
      FinPlanProfile(name: name, email: email), // Pass name and email to FinPlanProfile
    ];
  });
}


  Future<Map<String, String?>> getUserPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    
    return {
      'name': name,
      'email': email,
    };
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList.isNotEmpty ? _screenList[_selectedIndex] : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp),
            label: 'Add Plan',
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

class HomeScreen extends StatelessWidget {
  final String storedValue;

  const HomeScreen({Key? key, required this.storedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Halo, $storedValue!',
              style: const TextStyle(
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
