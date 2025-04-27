import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzlegame/grid.dart';
import 'package:puzzlegame/imagewiddget.dart';

class board extends StatefulWidget {
  const board({Key? key}) : super(key: key);
  @override
  _boardState createState() => _boardState();
}

class _boardState extends State<board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int noofmoves = 0;
  @override
  void initState() {
    super.initState();
    number.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Text("puzzle Game",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: imageDisplay("assets/images/logo.jpg")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(noofmoves.toString() + " moves | 15 Tiles",
                style: GoogleFonts.roboto(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(child: Grid(number, onClick))
      ],
    ));
  }

 void onClick(index) {
  // Left move
  if (index % 4 != 0 && number[index - 1] == 0) {
    setState(() {
      number[number.indexOf(0)] = number[index];
      number[index] = 0;
      noofmoves++;
    });
  }
  // Right move
  else if ((index + 1) % 4 != 0 && number[index + 1] == 0) {
    setState(() {
      number[number.indexOf(0)] = number[index];
      number[index] = 0;
      noofmoves++;
    });
  }
  // Up move
  else if (index - 4 >= 0 && number[index - 4] == 0) {
    setState(() {
      number[number.indexOf(0)] = number[index];
      number[index] = 0;
      noofmoves++;
    });
  }
  // Down move
  else if (index + 4 < 16 && number[index + 4] == 0) {
    setState(() {
      number[number.indexOf(0)] = number[index];
      number[index] = 0;
      noofmoves++;
    });
  }

  checkInner();
}


  bool isShorted(List numberList) {
    int first = number.first;
    for (int i = 1; i < numberList.length; i++) {
      int nextNumber = numberList[i];
      if (first > nextNumber) return false;
      first = numberList[i];
    }
    return true;
  }

  void checkInner() {
    bool isWinner = isShorted(number);
    if (isWinner) {
      (print("winner"));
    } else {
      print("Not Sorted");
    }
  }
}
