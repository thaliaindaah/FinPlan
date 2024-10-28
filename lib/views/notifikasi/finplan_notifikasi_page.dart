import 'package:flutter/material.dart';

class FinplanNotifikasiPage extends StatelessWidget {
  const FinplanNotifikasiPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: ClipOval(
              child: Image.asset('lib/res/images/finplan_ic_back.png'),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text("Belum Ada Notifikasi"),
      ), 
    );
  }
}
