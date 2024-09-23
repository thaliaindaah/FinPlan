import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BannerNotFound extends StatelessWidget{
  const BannerNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("lib/res/assets/banner_not_found.json"),
    );
  }

}