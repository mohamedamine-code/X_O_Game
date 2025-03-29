// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:games_x_o/util/box.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String xoDisplay = 'X';
  bool X_dispaly = true;

  List<String> xoDisplay_list = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int nbre_xo = 0;

  void tapped(int index) {
    setState(() {
      if (X_dispaly && xoDisplay_list[index] == '') {
        xoDisplay_list[index] = xoDisplay;
        xoDisplay = 'O';
        nbre_xo++;
      } else if (X_dispaly != true && xoDisplay_list[index] == '') {
        xoDisplay_list[index] = xoDisplay;
        xoDisplay = 'X';
        nbre_xo++;
      }
      X_dispaly = !X_dispaly;
    });
    checkWiner();
  }

  void checkWiner() {
    if (xoDisplay_list[0] == xoDisplay_list[1] &&
        xoDisplay_list[0] == xoDisplay_list[2] &&
        xoDisplay_list[0] != '') {
      dialoge(xoDisplay_list[0]);
    }

    if (xoDisplay_list[3] == xoDisplay_list[4] &&
        xoDisplay_list[3] == xoDisplay_list[5] &&
        xoDisplay_list[3] != '') {
      dialoge(xoDisplay_list[3]);
    }
    if (xoDisplay_list[6] == xoDisplay_list[7] &&
        xoDisplay_list[6] == xoDisplay_list[8] &&
        xoDisplay_list[8] != '') {
      dialoge(xoDisplay_list[6]);
    }
    if (xoDisplay_list[0] == xoDisplay_list[3] &&
        xoDisplay_list[0] == xoDisplay_list[6] &&
        xoDisplay_list[6] != '') {
      dialoge(xoDisplay_list[0]);
    }
    if (xoDisplay_list[1] == xoDisplay_list[4] &&
        xoDisplay_list[1] == xoDisplay_list[7] &&
        xoDisplay_list[1] != '') {
      dialoge(xoDisplay_list[1]);
    }
    if (xoDisplay_list[2] == xoDisplay_list[5] &&
        xoDisplay_list[2] == xoDisplay_list[8] &&
        xoDisplay_list[2] != '') {
      dialoge(xoDisplay_list[2]);
    }
    if (xoDisplay_list[0] == xoDisplay_list[4] &&
        xoDisplay_list[0] == xoDisplay_list[8] &&
        xoDisplay_list[0] != '') {
      dialoge(xoDisplay_list[0]);
    }
    if (xoDisplay_list[2] == xoDisplay_list[4] &&
        xoDisplay_list[2] == xoDisplay_list[6] &&
        xoDisplay_list[2] != '') {
      dialoge(xoDisplay_list[2]);
    }
    if (nbre_xo == 9) {
      DrawDialoge();
    }
  }

  void DrawDialoge() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent[700],
            title: const Text('D R A W !'),
            content: Text('No Plyaer is Win !'),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    rest();
                  },
                  child: const Text(
                    'R E P L A Y !',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          );
        });
    setState(() {
      nbre_xo = 0;
    });
  }

  void dialoge(String xo) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 251, 109, 0),
            title: Text('W I N E R !'),
            content: Text(
              'The Winner is ' '$xo',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    rest();
                  },
                  child: Text(
                    'R E P L A Y !',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          );
        });
    if (xo == 'O') {
      setState(() {
        score_po++;
      });
    } else if (xo == 'X') {
      setState(() {
        score_px++;
      });
    }
    setState(() {
      nbre_xo = 0;
    });
  }

  void rest() {
    setState(() {
      for (int i = 0; i < xoDisplay_list.length; i++) {
        xoDisplay_list[i] = '';
      }
    });
  }

  var playerStyle =
      TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
  var scoreStyel = TextStyle(
      fontSize: 22,
      color: Colors.greenAccent[700],
      fontWeight: FontWeight.bold);
  int score_px = 0;
  int score_po = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'G A M E  X / O',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Player O',
                          style: playerStyle,
                        ),
                        Text('Score : $score_po', style: scoreStyel),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Player X',
                          style: playerStyle,
                        ),
                        Text('Score : $score_px', style: scoreStyel),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: box(
                          data: xoDisplay_list[index],
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
