import 'package:flutter/material.dart';
import 'package:xo_game_project/board_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";
  String player1 = '';
  String player2 = '';
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Let's Go !!!",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Container(

        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (newText) {
                player1 = newText;
              },
              decoration: const InputDecoration(
                  hintText: "Enter Player1 Name",
                  hintStyle: TextStyle(fontSize: 20)),
            ),
            TextField(
              onChanged: (newText) {
                player2 = newText;
              },
              decoration: const InputDecoration(
                  hintText: "Enter Player2 Name",
                  hintStyle: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 55),
                    backgroundColor: Colors.purple,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pushNamed(context, BoardScreen.routeName,
                      arguments: BoardScreenArgs(player1, player2));
                },
                child: const Text("Start Game"))
          ],
        ),
      ),
    );
  }
}
