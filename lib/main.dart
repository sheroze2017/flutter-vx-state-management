import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practise1/core/store.dart';
import 'package:practise1/pages/cart_page.dart';
import 'package:practise1/pages/sign_up.dart';

import 'package:practise1/pages/home.dart';
import 'package:practise1/pages/login_page.dart';
import 'package:practise1/pages/sign_up.dart';
import 'package:practise1/util/route.dart';
import 'package:practise1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'util/route.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(),
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => Loginpage(),
        // MyRoutes.signRoute: (context) => SignUp(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
