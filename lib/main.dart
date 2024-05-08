import 'package:flutter/material.dart';
import 'package:xo_game_project/board_screen.dart';
import 'package:xo_game_project/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName : (context) => LoginScreen(),
        BoardScreen.routeName : (context) => BoardScreen()
      },
    );
  }
}