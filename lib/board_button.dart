import 'package:flutter/material.dart';

typedef onPlayerClickCallback = void Function (int);

class BoardButton extends StatelessWidget {

  String text;
  onPlayerClickCallback onPlayerClickedCallback;
  int pos;

  BoardButton({super.key, required this.text,required this.onPlayerClickedCallback,required this.pos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            onPlayerClickedCallback(pos);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          child: Text(
            text,
             style: const TextStyle(fontSize: 70),
          ),
        ),
      ),
    );
  }
}
