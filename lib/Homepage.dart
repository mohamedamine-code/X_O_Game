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

  void tapped(int index) {
    setState(() {
      if (X_dispaly) {
        xoDisplay_list[index] = xoDisplay;
        xoDisplay = 'O';
      }
      if (X_dispaly != true) {
        xoDisplay_list[index] = xoDisplay;
        xoDisplay = 'X';
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
  }

  void dialoge(String xo) {
    showDialog(
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
                  child: Text('R E P L A Y',style: TextStyle(fontSize: 18),)),
            ],
          );
        });
  }

  void rest() {
    setState(() {
      for (int i = 0; i < xoDisplay_list.length; i++) {
        xoDisplay_list[i] = '';
      }
    });
  }

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
            height: 100,
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: box(
                        data: xoDisplay_list[index],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
