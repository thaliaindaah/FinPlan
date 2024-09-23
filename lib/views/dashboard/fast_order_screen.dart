import 'package:flutter/material.dart';

class FastOrderScreen extends StatefulWidget{
  const FastOrderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastOrderScreen();

}

class _FastOrderScreen extends State<FastOrderScreen>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Fast Order Screen"),
      ),
    );
  }

}