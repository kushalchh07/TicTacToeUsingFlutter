import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  child: Text(
                    "TIC TAC TOE",
                    style: newFontOther,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                  glowColor: Colors.white,
                  duration: Duration(seconds: 2),
                  repeat: true,
                  startDelay: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      radius: 80.0,
                      child: Container(
                        child: Image(
                          image: AssetImage("images/tictac.png"),
                          height: size.height * 0.50,
                          width: size.height * 0.50,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
