import 'package:flutter/material.dart';

const APP_PRIMARY = Color(0xff064264);
const APP_ACCENT = Color(0xffF1003A);
const REAL_WHITE = Color(0xffffffff);
const REAL_BLACK = Color(0xff000000);
const Color SCAFFOLD_BG = Color(0xfff9f9f9);
const Color SHIMMER_LIGHT = Color(0xffE4E6EB);
const Color SHIMMER_DARK = Color(0xffD8DADF);
const APP_BLACK = Color(0xff040301);
const Color APP_GREEN = Color(0xff4AD393);
const Color APP_GREY = Color(0xff757575);
const Color APP_RED = Color(0xffD83A43);
const Color APP_GOLD = Color(0xffFEBE01);
const Color APP_DARK = Color(0xff020A18);

// ranges from 0.0 to 1.0
// DARKEN
Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

// LIGHTEN
Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

// TEXTSTYLE
const TextStyle normalTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: APP_BLACK);

const TextStyle titleTextStyle =
    TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: APP_BLACK);

// BUTTON
Container normalButton(
    {@required double v16, @required Color bgColor, @required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: v16, horizontal: v16 * 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    child: Center(
        child: Text(
      title,
      style: normalTextStyle.copyWith(color: REAL_WHITE),
    )),
  );
}

// BUTTON
Container normalButtonWithBorder(
    {@required double v16,
    @required Color bgColor,
    @required Color borderColor,
    double borderRadius = 8,
    BoxShadow boxShadow,
    double borderWidth = 2,
    @required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: v16, horizontal: v16 * 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [boxShadow],
      border: Border.all(
          color: borderColor, width: borderWidth, style: BorderStyle.solid),
      color: bgColor,
    ),
    child: Center(
        child: Text(
      title,
      style: normalTextStyle.copyWith(color: REAL_WHITE),
    )),
  );
}

// SAMPLE IMAGES
const testImage =
    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

const faceImage =
    "https://images.pexels.com/photos/1882309/pexels-photo-1882309.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const flagImage = 'https://cdn.countryflags.com/thumbs/uganda/flag-400.png';

const testImage1 =
    "https://images.pexels.com/photos/1440727/pexels-photo-1440727.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage2 =
    "https://images.pexels.com/photos/7745561/pexels-photo-7745561.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage3 =
    "https://images.pexels.com/photos/850360/pexels-photo-850360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage4 =
    "https://images.pexels.com/photos/1042143/pexels-photo-1042143.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

// RIDERSHUB SPECIFIC
const Color APP_BELL = Color(0xff514CDE);
const Color LOGIN_FIELD = Color(0xff527C93);

BoxShadow LIGHT_BOXSHADOW = BoxShadow(
    color: REAL_BLACK.withOpacity(0.25),
    offset: Offset(0, 2),
    // spreadRadius: 1.2,
    blurRadius: 4);

BoxShadow DARK_BOXSHADOW = BoxShadow(
  color: REAL_WHITE.withAlpha(95),
  offset: Offset(0, 2),
  spreadRadius: 1.2,
  // blurRadius: 1.4
);
