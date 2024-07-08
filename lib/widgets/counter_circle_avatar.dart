import 'package:flutter/material.dart';

class CounterCircleAvatar extends StatelessWidget {
  CounterCircleAvatar({super.key, required this.counter});
  String counter;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.black,
      child: Text(
        counter,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: 'GemunuLibre',
        ),
      ),
    );
  }
}
