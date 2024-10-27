import 'package:flutter/material.dart';

class FinplanDetailPlan extends StatelessWidget {
  const FinplanDetailPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth * 0.9;
    double progress = 5000000 / 10000000;

    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Rencana Anggaran'),
      centerTitle: true,
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
      actions: [
      IconButton(
        icon: const Icon(Icons.filter_list), // Use the desired icon for the filter
        onPressed: () {
          // Define your filter action here
          // For example, show a dialog or navigate to a filter screen
        },
      ),
      const SizedBox(width: 20), // Optional: Add spacing after the icon
    ],
  ),
    body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
            width: dynamicWidth,
            height: 110,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 223, 70, 0.58), 
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/res/images/finplan_ic_no_budget.png', // Replace with your image path
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 5), // Add space between the image and the text
                    const Text(
                      'Total Saldo',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rp 10,000,000',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(width: 8), 
                    GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                      },
                      child: Image.asset(
                        'lib/res/images/finplan_ic_eyeshown.png', // Replace with your image path
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: dynamicWidth,
            height: 120,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 223, 70, 0.58), 
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/res/images/finplan_ic_no_budget.png', // Replace with your image path
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 5), // Add space between the image and the text
                    const Text(
                      'Pendapatan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                      '27 Oktober 2024',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gaji',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(width: 8), 
                    Text(
                      'Rp. 10,000,000',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
          width: dynamicWidth,
          height: 120,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 223, 70, 0.58), 
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/res/images/finplan_ic_no_budget.png', // Replace with your image path
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 5), // Add space between the image and the text
                  const Text(
                    'Tabungan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tabungan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    'Rp 10,000,000',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10), 
              SizedBox(
              height: 15, 
              child: LinearProgressIndicator(
                value: progress, 
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green), 
              ),
            )]),
          ),
          ],
        ),
        
      ),
    );
  }
}