// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayFriends extends StatefulWidget {
  const PlayFriends({super.key});

  @override
  State<PlayFriends> createState() => _PlayFriendsState();
}

class _PlayFriendsState extends State<PlayFriends> {
  List<String> expression = ['', '', '', '', '', '', '', '', ''];
  bool check = true;
  int countX = 0;
  int countO = 0;
  int checkdraw = 0;

  void _ontapped(int index) {
    setState(() {
      if (check) {
        expression[index] = 'O';
        checkdraw += 1;
      } else {
        expression[index] = 'X';
        checkdraw += 1;
      }
      check = !check;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (expression[0] != '' &&
        expression[0] == expression[1] &&
        expression[0] == expression[2]) {
      _showdialogbox(expression[0]);
    }
    if (expression[3] != '' &&
        expression[3] == expression[4] &&
        expression[3] == expression[5]) {
      _showdialogbox(expression[3]);
    }
    if (expression[6] != '' &&
        expression[6] == expression[7] &&
        expression[6] == expression[8]) {
      _showdialogbox(expression[6]);
    }
    if (expression[0] != '' &&
        expression[0] == expression[3] &&
        expression[0] == expression[6]) {
      _showdialogbox(expression[0]);
    }
    if (expression[1] != '' &&
        expression[1] == expression[4] &&
        expression[1] == expression[7]) {
      _showdialogbox(expression[1]);
    }
    if (expression[2] != '' &&
        expression[2] == expression[5] &&
        expression[2] == expression[8]) {
      _showdialogbox(expression[2]);
    }
    if (expression[0] != '' &&
        expression[0] == expression[4] &&
        expression[0] == expression[8]) {
      _showdialogbox(expression[0]);
    }
    if (expression[2] != '' &&
        expression[2] == expression[4] &&
        expression[2] == expression[6]) {
      _showdialogbox(expression[2]);
    } else if (checkdraw == 9) {
      _showdrawdialogbox();
    }
  }

  void _showdialogbox(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over'),
        content: Text('Player $winner wins!'),
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
      countO = countO + 1;
    } else {
      countX += 1;
    }
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

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        expression[i] = '';
      }
      checkdraw = 0;
    });
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
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: bgcolor,
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
                          "Player X",
                          style: newFontOther,
                        ),
                        Text(
                          countX.toString(),
                          style: newFontOther,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Player O",
                          style: newFontOther,
                        ),
                        Text(
                          countO.toString(),
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
