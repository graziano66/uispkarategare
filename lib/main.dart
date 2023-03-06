import 'package:flutter/material.dart';
import 'package:uispkarategare/pages/homepage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UISP DO Karate',
//      theme: ThemeData.dark().copyWith(
//        scaffoldBackgroundColor: bgColor,
//        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
//            .apply(bodyColor: Colors.white),
//        canvasColor: secondaryColor,
//      ),
      home: HomePage(title: 'D.O. UISP - Gestione gare'),
    );
  }
}
