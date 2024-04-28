import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/homepage.dart';

class GoTo extends StatelessWidget {
  const GoTo({super.key});
  static var newFontOther = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 40));
  @override
  Widget build(BuildContext context) {
    final bgcolor = Colors.black;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "TIC TAC TOE",
              style: newFontOther,
            ),
            Image(
              image: AssetImage("images/tictac.png"),
              height: size.height * 0.50,
              width: size.height * 0.50,
            ),
            SizedBox(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "Play Game",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(450, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
