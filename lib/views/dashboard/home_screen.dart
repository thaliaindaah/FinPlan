import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75.0,
        title: Row(
          children: [
            const Text("Halo, Thalia!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.black, size: 30))
        ],
        backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Container(
                height: 150.0, // Set height for the image
                width: 150.0,  // Set width if needed
                child: Image.asset(
                  'lib/res/images/finplan_ic_no_budget.png',
                ),
              ),
              SizedBox(height: 10.0), // Space between image and text
              const Text(
                'Belum Ada Rencana\nAnggaran',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center text
              ),
              SizedBox(height: 20.0), // Space between image and text
              const Text(
                'Buat rencana anggaranmu sekarang dan lihat trend pengeluaranmu setelahnya.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center, // Center text
              ),
              SizedBox(height: 30.0), // Space between text and button
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Text('Tambah Anggaran', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: const Size(200, 50),
                    backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
  }
}

