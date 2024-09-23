import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget{
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketScreen();

}

class _TicketScreen extends State<TicketScreen>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Ticket Screen"),
      ),
    );
  }

}