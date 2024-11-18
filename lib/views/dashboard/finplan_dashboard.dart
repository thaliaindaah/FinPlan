import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_drive/views/add plan/finplan_add_plan.dart';
import 'package:test_drive/views/dashboard/home/finplan_home_screen.dart';
import 'package:test_drive/views/profile/finplan_profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static List<Widget> _screenList = [];
  List<DocumentSnapshot>? items;

  @override
  void initState() {
    super.initState();
    _loadStoredUserData(); // Load stored string on initialization
  }

 Future<void> _loadStoredUserData() async {
  Map<String, String?> userData = await getUserPreferences();
  List<DocumentSnapshot>? items = await _fetchData();
  setState(() {
    String name = userData['name'] ?? 'No name stored';
    String email = userData['email'] ?? 'No email stored';
    // Update the screen list with the latest stored value
    if (items != null && items.isNotEmpty) {
      _screenList = [
      FinPlanHomeScreenShowPlan(listItems: items, storedValue: name), // Pass the name to HomeScreen
      const AddPlan(fromButtonX: false), // Your add plan screen widget
      FinPlanProfile(name: name, email: email), // Pass name and email to FinPlanProfile
    ];
    }else{
      _screenList = [
      FinplanHomeScreen(storedValue: name), // Pass the name to HomeScreen
      const AddPlan(fromButtonX: false), // Your add plan screen widget
      FinPlanProfile(name: name, email: email), // Pass name and email to FinPlanProfile
    ];
    }
  });
}

  Future<List<DocumentSnapshot>?> _fetchData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('plan').get();
    setState(() {
      items = snapshot.docs; // Store documents in the items list
    });
    return items;
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
