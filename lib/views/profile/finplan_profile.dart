import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_drive/views/login/finplan_login.dart';

class FinPlanProfile extends StatelessWidget {
  final String name;
  final String email;

  const FinPlanProfile({Key? key, required this.name, required this.email}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    // Clear user data from Shared Preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate back to the login screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())
      );
  }

  void _deleteAccount() {
    // Add account deletion functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              alignment: Alignment.center,
              child: const Text(
              'T',
              style: TextStyle(
                fontSize: 80, 
                fontWeight: FontWeight.bold, 
                color: Colors.grey),
            ),
            ),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 24)),
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 150),
            ElevatedButton(
            onPressed: () => _logout(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: const Size(220, 50),
              backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Logout'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _deleteAccount,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: const Size(220, 50),
              backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Hapus Akun'),
          ),
          ],
        ),
      ),
    );
  }
}
