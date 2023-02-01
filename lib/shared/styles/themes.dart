import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
primarySwatch: defaultColor,
scaffoldBackgroundColor: Colors.white,
appBarTheme: AppBarTheme(
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark,
),
backgroundColor: Colors.white,
elevation: 0.0,
titleTextStyle: TextStyle(
color: Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
iconTheme: IconThemeData(
color: Colors.black
),
),
textTheme: TextTheme(
bodyText1: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.black45
)
),
fontFamily: 'Janna',
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type:BottomNavigationBarType.fixed,
selectedItemColor:defaultColor,
elevation: 10.0,
),

);

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor("333739"),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor("333739"),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor("333739"),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white
      )
  ),
  fontFamily: 'Janna',
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: HexColor("333739"),
    type:BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.blueGrey,
    elevation: 10.0,
  ),

);
