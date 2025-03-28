// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class box extends StatelessWidget {
  const box({required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(child: Text(data,style: TextStyle(color: Colors.white,fontSize: 40),)),
    );
  }
}
