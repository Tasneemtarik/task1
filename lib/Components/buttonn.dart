import 'package:flutter/material.dart';

class Buttonn extends StatelessWidget {
  Buttonn({required this.textt, required this.func});
  String textt;
   Function()? func;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        textt,
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      onPressed:func ,
      style: ElevatedButton.styleFrom(
          fixedSize: Size( 150, 40),
          backgroundColor: Color(0xffaf164a)),
    );
  }
}
