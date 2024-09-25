import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_drive/views/login/finplan_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String id = "SplashScreen";

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  late Timer _timer;
  int _second = 5;

  void startSplash(){
    const oneSecond = Duration(seconds: 1);
    
    _timer = Timer.periodic(oneSecond, (timer) {
      if(_second == 0){
        setState(() {
          _timer.cancel();
          _moveToMainScreen();
        });
      }else{
        setState(() {
          _second--;
        });
      }
    });
  }

  void _moveToMainScreen(){
   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
);

  }

  @override

  void initState() {
    startSplash();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("lib/res/images/finplan_logo.png"),
      ),
    );
  }

}
