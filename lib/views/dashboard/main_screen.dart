import 'package:flutter/material.dart';
import 'package:FinPlan/views/dashboard/home_screen.dart';
import 'package:FinPlan/views/dashboard/more_screen.dart';
import 'package:FinPlan/views/dashboard/ticket_screen.dart';

class MainScreen extends StatefulWidget{

  const MainScreen({Key? key}) : super(key: key);

  static const String id = "MainScreen";

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>{

  int _selectIndex = 0;

  static const List<Widget> _screenList = [
    HomeScreen(),
    TicketScreen(),
    MoreScreen()
  ];

  void _onItemTapped(int index){
    setState((){
      _selectIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_outlined),
              label: 'Account'
          )
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.pink[100],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Color.fromRGBO(59, 118, 34, 1),
      ),
    );
  }

}