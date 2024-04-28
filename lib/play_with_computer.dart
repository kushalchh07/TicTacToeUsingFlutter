import 'package:flutter/material.dart';

class PlayComputer extends StatefulWidget {
  const PlayComputer({super.key});

  @override
  State<PlayComputer> createState() => _PlayComputerState();
}

class _PlayComputerState extends State<PlayComputer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bgcolor = Color.fromARGB(255, 20, 0, 85);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.yellow,
            )),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Color.fromARGB(255, 20, 0, 85)),
      ),
    );
  }
}
