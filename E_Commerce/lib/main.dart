import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/pages/cart_page.dart';
import 'package:e_commerce/util/route.dart';
import 'package:e_commerce/widget/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),

      initialRoute: "/login",
      routes:{
          "/":(context)=>HomePage(),
          MyRoute.homeRoute:(context)=>HomePage(),
          MyRoute.loginRoute:(context)=>LoginPage(),
          MyRoute.cartRoute:(context)=>CartPage(),

      } ,
    );
  }
}
