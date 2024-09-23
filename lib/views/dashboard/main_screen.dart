import 'package:flutter/material.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/views/dashboard/fast_order_screen.dart';
import 'package:test_drive/views/dashboard/home_screen.dart';
import 'package:test_drive/views/dashboard/more_screen.dart';
import 'package:test_drive/views/dashboard/profile_screen.dart';
import 'package:test_drive/views/dashboard/ticket_screen.dart';

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
    FastOrderScreen(),
    ProfileScreen(),
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
      appBar: AppBar(
        title: SizedBox(
          height: context.resources.dimension.size75,
          width: context.resources.dimension.size75,
          child: Image.asset("lib/res/images/cgv_logo.png"),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.qr_code_2, color: Colors.black,))
        ],
        backgroundColor: context.resources.color.backgroundColor,
        ),
      body: _screenList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: 'Ticket'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Fast Order'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'MyCgv'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More'
          )
        ],
        currentIndex: _selectIndex,
        selectedItemColor: context.resources.color.redColor,
        unselectedItemColor: context.resources.color.grayX11Color,
        onTap: _onItemTapped,
      ),
    );
  }

}