import 'dart:ui';

import 'package:flutter/src/material/colors.dart';
import 'package:test_drive/res/colors/base_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors implements BaseColors {
  @override
  Color get dollarBillColor => HexColor("#91C757");

  @override
  Color get maximumPurpleColor => HexColor("#7D2885");

  @override
  Color get oceanBoatBlueColor => HexColor("#0477BF");

  @override
  Color get princetonOrangeColor => HexColor("#F28322");

  @override
  Color get redColor => HexColor("#EB1C24");

  @override
  Color get backgroundColor => HexColor("#F8F8F8");

  @override
  MaterialColor get accentColor => Colors.blue;

  @override
  MaterialColor get primaryColor => Colors.red;

  @override
  Color get grayX11Color => HexColor("#BEBEBE");
}
