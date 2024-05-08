import 'package:flutter/material.dart';
import 'package:xo_game_project/board_button.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = "board_screen";

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {

  int player1Score = 0;
  int player2Score = 0;

  List<String> boardState = [
    '', '', '',
    '', '', '',
    '', '', '',
  ];


  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as BoardScreenArgs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        toolbarHeight: 80,
        title: const Text(
          "XO Game",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                   Text(
                     "${args.Player1}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text("Score: $player1Score", style:const TextStyle(fontSize: 25)),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                   Text("${args.Player2}",
                       style: const TextStyle(fontSize: 25)),
                  Text("Score: $player2Score",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[0],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 0),

                BoardButton(
                    text: boardState[1],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 1),
                BoardButton(
                    text: boardState[2],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[3],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 3),
                BoardButton(
                    text: boardState[4],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 4),
                BoardButton(
                    text: boardState[5],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[6],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 6),

                BoardButton(
                    text: boardState[7],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 7),
                BoardButton(
                    text: boardState[8],
                    onPlayerClickedCallback: onPlayerClick,
                    pos: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
   int counter = 0;
  void onPlayerClick(int index) {
    if(boardState[index].isNotEmpty){
      return;
    }
  if (counter.isEven){
    boardState[index] = 'X';
    //player1Score++;
  }else{
    boardState[index] = 'O';
    //player2Score++;
  }
  counter++;

  if(checkWinner("X")){
    player1Score+=5;
    initBoard();
  }else if(checkWinner("O")){
    player2Score+=5;
    initBoard();

  }else if (counter==9){
    initBoard();

  }
    setState(() {

    });
  }

  bool checkWinner(String playerSymbol){
    for(int i = 0; i < 9 ; i+=3){
     if( boardState[i] == playerSymbol&&
         boardState[i+1] == playerSymbol&&
         boardState[i+2] == playerSymbol){
       return true;
     }


    }
    for(int i = 0; i < 3 ; i++){
         if( boardState[i] == playerSymbol&&
             boardState[i+3] == playerSymbol&&
             boardState[i+6] == playerSymbol){
           return true;
         }

    }

    if( boardState[0] == playerSymbol&&
        boardState[4] == playerSymbol&&
        boardState[8] == playerSymbol){
      return true;
    }if(boardState[2] == playerSymbol&&
        boardState[4] == playerSymbol&&
        boardState[6] == playerSymbol){
      return true;
    }
    return false;
  }

  void initBoard() {
    counter = 0;
    boardState = ['','','','','','','','',''];
  }
}

class BoardScreenArgs {
  String Player1;
  String Player2;

  BoardScreenArgs( this.Player1, this.Player2){

  }

}
