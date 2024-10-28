import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_drive/views/add%20plan/finplan_add_plan.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test_drive/views/add%20plan/finplan_detail_plan.dart';
import 'package:test_drive/views/notifikasi/finplan_notifikasi_page.dart';
import 'package:test_drive/views/report/finplan_detail_report.dart';

class FinplanHomeScreen extends StatelessWidget {
  const FinplanHomeScreen({Key? key, required this.storedValue}) : super(key: key);

  final String storedValue;
  

  void _navigateToAddPlan(BuildContext context) async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPlan(fromButtonX: true)));
  }

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FinplanNotifikasiPage()));
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
              'lib/res/images/finplan_ic_no_budget.png',
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
              onPressed: () {
                _navigateToAddPlan(context);
              },
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

class FinPlanHomeScreenShowPlan extends StatelessWidget {
  const FinPlanHomeScreenShowPlan({
    Key? key,
    required this.listItems,
    required this.storedValue,
  }) : super(key: key);

  final String storedValue;
  final List<DocumentSnapshot>? listItems;

  String _getMonthName(int monthIndex) {
  switch (monthIndex) {
    case 1: return 'Jan';
    case 2: return 'Feb';
    case 3: return 'Mar';
    case 4: return 'Apr';
    case 5: return 'May';
    case 6: return 'Jun';
    case 7: return 'Jul';
    case 8: return 'Aug';
    case 9: return 'Sep';
    case 10: return 'Oct';
    case 11: return 'Nov';
    case 12: return 'Dec';
    default: return '';
  }
}

  @override
  Widget build(BuildContext context) {

    double totalPendapatan = 0;
    double totalPengeluaran = 0;

    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth * 0.9;

    List<double> spendingData = [100, 50, 200, 150, 300];
    List<DateTime> dates = [
      DateTime(2023, 1, 1),
      DateTime(2023, 2, 2),
      DateTime(2023, 3, 3),
      DateTime(2023, 4, 4),
      DateTime(2023, 5, 5),
    ];
    // Calculate totals based on type
    if (listItems != null) {
      for (var item in listItems!) {
        String type = item['plan'];
        double amount = item['amount'];
        
        if (type == 'Pendapatan') {
          totalPendapatan += amount;
        } else if (type == 'Pengeluaran') {
          totalPengeluaran += amount;
        }
      }
    }

    // Calculate the result
    String formatedIncome = NumberFormat('#,##0', 'en_US').format(totalPendapatan.toInt());
    double result = totalPendapatan - totalPengeluaran;
    String formattedResult = NumberFormat('#,##0', 'en_US').format(result.toInt());
    double progress = result / totalPendapatan;

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
                // Notification button action
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Rencana Anggaran',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16), 
                child: TextButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinplanDetailPlan(),
                    ),
                    );
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 118, 34, 1)),
                  ),
                ),
              ),
            ],
          ),
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
                    'Saldo Saat Ini',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp $formattedResult / Rp $formatedIncome',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0), 
                child: Text(
                  'Report',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16), 
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinplanDetailReport(),
                    ),
                    );
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 118, 34, 1)),
                  ),
                ),
              ),
            ],
          ), 
          Container(
          width: dynamicWidth,
          height: 500,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
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
                    'lib/res/images/finplan_ic_report.png', // Replace with your image path
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 5), // Add space between the image and the text
                  const Text(
                    'Tren Pengeluaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20), 
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toString(),
                              style: const TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            // Make sure the value is within the expected range
                            int monthIndex = value.toInt();
                            return monthIndex >= 1 && monthIndex <= 12
                                ? Text(
                                    _getMonthName(monthIndex),
                                    style: const TextStyle(fontSize: 10),
                                  )
                                : const Text('');
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: List<FlSpot>.generate(spendingData.length, (index) {
                          double xValue = dates[index].month.toDouble(); // Use the month (1-12)
                          return FlSpot(xValue, spendingData[index]);
                        }),
                        isCurved: true,
                        color: const Color.fromRGBO(236, 102, 102, 1),
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
          ]),
          ), 
        ],
      ),
    )
    );
  }
}