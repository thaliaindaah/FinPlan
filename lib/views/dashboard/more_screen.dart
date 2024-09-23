import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget{
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoreScreen();

}

class _MoreScreen extends State<MoreScreen>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("More Screen"),
      ),
    );
  }

}