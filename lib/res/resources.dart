import 'package:flutter/material.dart';
import 'package:FinPlan/res/colors/app_colors.dart';
import 'package:FinPlan/res/strings/indonesia_strings.dart';
import 'package:FinPlan/res/strings/strings.dart';

import 'dimensions/app_dimensions.dart';

class Resources{
  final BuildContext _context;

  Resources(this._context);

  Strings get strings{
    Locale locale = Localizations.localeOf(_context);
    switch(locale.languageCode){
      case "ind":
        return IndonesiaStrings();
      default:
        return IndonesiaStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimensions get dimension{
    return AppDimensions();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}