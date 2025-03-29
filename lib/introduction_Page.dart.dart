// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:games_x_o/Homepage.dart';

class introduction extends StatefulWidget {
  const introduction({super.key});

  @override
  State<introduction> createState() => _introductionState();
}

class _introductionState extends State<introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Tic Tac Toc',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 0,
            ),
            AvatarGlow(
              glowRadiusFactor :0.3,
              child: ClipOval(
                child: Image.asset('assets/img/_tictactoe.jpg',width: 230,height: 230,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent[700],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('L E T \'S  P L A Y !',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)),
            ),
            Text('@Create By Mohamed Amine',style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}