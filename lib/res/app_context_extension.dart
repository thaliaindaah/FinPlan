import 'package:flutter/material.dart';
import 'package:FinPlan/res/resources.dart';

extension AppContext on BuildContext{
  Resources get resources => Resources.of(this);
}