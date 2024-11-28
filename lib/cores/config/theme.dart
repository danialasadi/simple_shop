import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThemes {
  static darkTheme({String fontFamily = 'Vazir'}) {
    return ThemeData(
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
              fontFamily: fontFamily,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400),
        ),
        colorScheme: const ColorScheme.dark());
  }

//    light theme  ---------------------------------------------------------------------


  static lightTheme({String fontFamily = 'Vazir'}) {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0XFFF9F9F9),
        appBarTheme: const AppBarTheme(color: Colors.white),
        textTheme: TextTheme(
          /////////////////////////////////////// title
          titleLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
                color: Colors.black,
      
          ),


          titleMedium: TextStyle(
              fontFamily: fontFamily,
              fontSize: 18.sp,
           color: Colors.black,
              fontWeight: FontWeight.w500),


          titleSmall: TextStyle(
              fontFamily: fontFamily,
              fontSize: 14.sp,
              color:  Colors.black,
              fontWeight: FontWeight.w500),

///////////////////////////////////////  body

          bodyLarge: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16.sp,
                  color: Colors.black,
              fontWeight: FontWeight.w700),

          bodyMedium: TextStyle(
              fontFamily: fontFamily,
              fontSize: 14.sp,
                  color: Colors.black,
              fontWeight: FontWeight.w700),

          bodySmall: TextStyle(
              fontFamily: fontFamily,
              fontSize: 12.sp,
                  color: Colors.black,
              fontWeight: FontWeight.w700),
        ),




        primaryColor: const Color(0XFF2D64CF),
        colorScheme: const ColorScheme.light());
  }
}
