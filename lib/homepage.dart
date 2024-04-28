import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/play_with_computer.dart';
import 'package:tic_tac_toe/play_with_friends.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static var newFont = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.yellow, letterSpacing: 3, fontSize: 40));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: Color.fromARGB(255, 20, 0, 85)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TIC TAC TOE",
                style: newFont,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  'PLAY WITH COMPUTER',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayComputer()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(450, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  'PLAY WITH FRIENDS',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayFriends()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(450, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
