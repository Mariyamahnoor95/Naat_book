import 'package:flutter/material.dart';
// import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static ThemeData lightTheme(BuildContext context)  {
     return ThemeData(
       // primarySwatch: Colors.teal,
       // textTheme: CyrillicFonts.robotoCondensedTextTheme(
       //  Theme.of(context).textTheme,),
       //GoogleFonts.notoNastaliqUrduTextTheme
       textTheme: GoogleFonts.notoNaskhArabicTextTheme(Theme.of(context).textTheme),//Nastaliq Urdu
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        color: Color(0xFF006064),
  ),
     );
}
 static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark
    );
 }
 static Color greenColor =Color(0xFF006064) ;
}
