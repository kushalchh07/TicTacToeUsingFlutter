import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/play_with_computer.dart';
import 'package:tic_tac_toe/play_with_friends.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static var newFont = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 40));

  @override
  Widget build(BuildContext context) {
    void _onpressedFriend() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayFriends()));
    }

    void _onpressedComputer() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayComputer()));
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: Colors.black),
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
              Button(text: "Play With Friends", onpressed: _onpressedFriend),
              SizedBox(
                height: 20,
              ),
              Button(text: "Play With Computer", onpressed: _onpressedComputer)
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const Button({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(450, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
              fontSize: size.height * 0.05, fontWeight: FontWeight.bold)),
    );
  }
}
