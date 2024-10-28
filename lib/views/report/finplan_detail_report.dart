import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FinplanDetailReport extends StatelessWidget {
  FinplanDetailReport({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> data = [
    {'category': 'Makanan', 'value': 40},
    {'category': 'Transportasi', 'value': 30},
    {'category': 'Hiburan', 'value': 20},
    {'category': 'Lainnya', 'value': 10},
  ];


  List<PieChartSectionData> showingSections() {
  final totalValue = data.fold<int>(0, (sum, item) {
    final value = item['value'];
    if (value is int) {
      return sum + value; 
    }
    return sum; 
  });

  return data.map((item) {
    final value = item['value'] as int;
    final category = item['category'] as String;

    return PieChartSectionData(
      value: value.toDouble(), 
      title: '${(value / totalValue * 100).toStringAsFixed(1)}%', 
      color: _getCategoryColor(category),
      titleStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }).toList();
}

// Color mapping function
Color _getCategoryColor(String category) {
  switch (category) {
    case 'Makanan':
      return Colors.red;
    case 'Transportasi':
      return Colors.blue;
    case 'Hiburan':
      return Colors.green;
    case 'Belanja':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

  @override
  Widget build(BuildContext context) {
    List<double> spendingData = [100, 50, 200, 150, 300];
    List<DateTime> dates = [
      DateTime(2023, 1, 1),
      DateTime(2023, 2, 2),
      DateTime(2023, 3, 3),
      DateTime(2023, 4, 4),
      DateTime(2023, 5, 5),
    ];
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
  return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: false,
    title: const Text('Report'),
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
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity, // Use double.infinity for full width
            height: 500,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
                      borderData: FlBorderData(show: false), // Remove chart border
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
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 270, // Set desired height for pie chart
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
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
                      'Detail Pengeluaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: PieChart(
                          PieChartData(
                            sections: showingSections(),
                            centerSpaceRadius: 45,
                            borderData: FlBorderData(show: false),
                            centerSpaceColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0 , right: 10.0, top: 50.0), // Adjust padding as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: data.map((item) {
                            String category = item['category'];
                            Color color = _getCategoryColor(category);
                            return Column( // Wrap each Row in a Column for spacing
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: color, // Ensure color is not null
                                      margin: const EdgeInsets.only(right: 10),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      category, // Handle null title
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8), // Add spacing between items
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);}
}