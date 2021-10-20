// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: cream,
        buttonColor: Colors.blue[800],
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
        // textTheme: GoogleFonts.robotoTextTheme(
        //   Theme.of(context).textTheme,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      // cardColor: Colors.black,

      canvasColor: darkcream,
      buttonColor: Colors.blue[200],
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        color: Colors.purple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6:
                context.textTheme.headline6!.copyWith(color: Colors.white)),
      ));

  static Color cream = Color(0xfff5f5f5);
  static Color darkcream = Vx.gray700;
  static Color purple = Vx.purple400;
}
