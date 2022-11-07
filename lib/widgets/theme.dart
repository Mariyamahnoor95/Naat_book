import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static ThemeData lightTheme(BuildContext context)  {
     return ThemeData(
       primarySwatch: Colors.teal,
       cardColor: Colors.white,
       scaffoldBackgroundColor: greyColor,
       indicatorColor:const Color(0xFF006064) ,

       // textTheme: CyrillicFonts.robotoCondensedTextTheme(
       //  Theme.of(context).textTheme,),
       //GoogleFonts.notoNastaliqUrduTextTheme
       textTheme: GoogleFonts.notoNaskhArabicTextTheme(Theme.of(context).textTheme),//Nastaliq Urdu
       primaryColor: const Color(0xff000000),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        color: Color(0xFF006064),
        titleTextStyle: TextStyle(color: Colors.white)

  ),
     );
}
 static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.teal,
      // brightness: Brightness.dark,
      textTheme: GoogleFonts.notoNaskhArabicTextTheme(Theme.of(context).textTheme),
      cardColor:  darkgreyColor,
     scaffoldBackgroundColor:Colors.black,
      primaryColor: Color(0xffffffff),

      indicatorColor:const Color(0xff3b925a) ,//Nastaliq Urdu
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          color: Color(0xFF006064),
          titleTextStyle: TextStyle(color: Colors.white)
          // titleTextStyle: TextStyle(color: Color(0xff3b925a))

      ),
    );
 }
 static Color greenColor =const Color(0xFF006064) ;
  static Color greyColor = Color(0xfff5f5f5);
  static Color lightgreenColor = Color(0xff2e6642);
  static Color darkgreyColor = Color(0xff1f251f);



}
