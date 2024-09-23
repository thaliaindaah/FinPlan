import 'package:flutter/material.dart';
import 'package:test_drive/res/resources.dart';

extension AppContext on BuildContext{
  Resources get resources => Resources.of(this);
}