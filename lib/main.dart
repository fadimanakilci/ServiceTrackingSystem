import 'package:flutter/material.dart';
import 'package:terrasoft/helpers/color_helper.dart';
import 'package:terrasoft/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorHelper.background,
        brightness: Brightness.light,
        primaryColor: ColorHelper.primary,
        shadowColor: Colors.grey,
        appBarTheme: const AppBarTheme(
            elevation: 3,
            shadowColor: Colors.white,
            toolbarHeight: 80,
            centerTitle: true,
            // color: Colors.white,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: ColorHelper.primaryDark,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 20
            ),
            toolbarTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        bottomAppBarColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          elevation: 5,
        ),
      ),
      home: HomePage(),
    );
  }
}
