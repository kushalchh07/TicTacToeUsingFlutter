import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayComputer extends StatefulWidget {
  const PlayComputer({super.key});

  @override
  State<PlayComputer> createState() => _PlayComputerState();
}

class _PlayComputerState extends State<PlayComputer> {
  List<String> expression = List.filled(9, '');
  bool _isPlayerTurn = true;
  // true for player, false for computer
  final _random = Random();
  int checkdraw = 0;

  int countComputer = 0;
  int countPlayer = 0;

  void _ontapped(int index) {
    // if (expression[index] == '' &&
    //     !_checkWinner() &&
    //     !_checkDraw() &&
    //     _isPlayerTurn) {
    setState(() {
      if (_isPlayerTurn) {
        expression[index] = 'O';
        checkdraw += 1;
      }
      _isPlayerTurn = false;

      {
        _makeComputerMove();
        checkdraw += 1;
      }
      _isPlayerTurn = !_isPlayerTurn;
      _checkWinner();
    });
    // }
  }

  void _showDialog(String winner) {
    if (winner == 'O') {
      winner = "You";
    } else {
      winner = "Computer";
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over'),
        content: Text('$winner won!'),
        actions: [
          TextButton(
            onPressed: () {
              _clearboard();
              Navigator.pop(context);
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
    if (winner == 'O') {
      countPlayer = countPlayer + 1;
    } else {
      countComputer += 1;
    }
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        expression[i] = '';
      }
      checkdraw = 0;
    });
  }

  bool _checkWinner() {
    //   // Implement the logic to check for a winner
    // Check rows
    if (expression[0] != '' &&
        expression[0] == expression[1] &&
        expression[0] == expression[2]) {
      _showDialog(expression[0]);
    }
    if (expression[3] != '' &&
        expression[3] == expression[4] &&
        expression[3] == expression[5]) {
      _showDialog(expression[3]);
    }
    if (expression[6] != '' &&
        expression[6] == expression[7] &&
        expression[6] == expression[8]) {
      _showDialog(expression[6]);
    }
    if (expression[0] != '' &&
        expression[0] == expression[3] &&
        expression[0] == expression[6]) {
      _showDialog(expression[0]);
    }
    if (expression[1] != '' &&
        expression[1] == expression[4] &&
        expression[1] == expression[7]) {
      _showDialog(expression[1]);
    }
    if (expression[2] != '' &&
        expression[2] == expression[5] &&
        expression[2] == expression[8]) {
      _showDialog(expression[2]);
    }
    if (expression[0] != '' &&
        expression[0] == expression[4] &&
        expression[0] == expression[8]) {
      _showDialog(expression[0]);
    }
    if (expression[2] != '' &&
        expression[2] == expression[4] &&
        expression[2] == expression[6]) {
      _showDialog(expression[2]);
    } else if (checkdraw == 9) {
      _showdrawdialogbox();
    }
    return false;
  }

  void _showdrawdialogbox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over'),
        content: Text('Game Draw!!'),
        actions: [
          TextButton(
            onPressed: () {
              _clearboard();
              Navigator.pop(context);
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  bool _checkDraw() {
    //   // Implement the logic to check for a draw
    if (checkdraw == 9) {}
    return true;
  }

  void _makeComputerMove() {
    // Implement AI algorithm to make optimal move
    int index = _random.nextInt(9);
    while (expression[index] != '') {
      index = _random.nextInt(9);
    }
    expression[index] = 'X';
  }

  static var newFontOther = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bgcolor = Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: bgcolor),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  "ScoreBoard",
                  style: newFontOther,
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "You",
                          style: newFontOther,
                        ),
                        Text(
                          countComputer.toString(),
                          style: newFontOther,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Computer",
                          style: newFontOther,
                        ),
                        Text(
                          countPlayer.toString(),
                          style: newFontOther,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _ontapped(index);
                        print("tapped $index");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            expression[index],
                            style: TextStyle(fontSize: 40, color: Colors.grey),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
                child: Container(
                    child: Center(
                        child: Column(
              children: [
                Text(
                  "TIC TAC TOE",
                  style: newFontOther,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "@Created By Kushal",
                  style: newFontOther,
                ),
              ],
            )))),
          ],
        ),
      ),
    );
  }
}
