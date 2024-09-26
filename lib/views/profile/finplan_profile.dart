import 'package:flutter/material.dart';

class FinPlanProfile extends StatelessWidget {
  final String name = "Thalia";
  final String email = "thalia@mail.com";

  void _logout() {
    // Add logout functionality here
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
            onPressed: _logout,
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
