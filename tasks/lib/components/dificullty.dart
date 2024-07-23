import 'package:flutter/material.dart';

class Dificullty extends StatelessWidget {

  final dificulltyLevel;

  const Dificullty({
    required this.dificulltyLevel,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
            Icons.star,
            size: 15,
            color: (dificulltyLevel >= 1) ? Colors.blue : Colors.blue[100]
        ),
        Icon(
            Icons.star,
            size: 15,
            color: (dificulltyLevel >= 2) ? Colors.blue : Colors.blue[100]
        ),
        Icon(
            Icons.star,
            size: 15,
            color: (dificulltyLevel >= 3) ? Colors.blue : Colors.blue[100]
        ),
        Icon(
            Icons.star,
            size: 15,
            color: (dificulltyLevel >= 4) ? Colors.blue : Colors.blue[100]
        ),
        Icon(
            Icons.star,
            size: 15,
            color: (dificulltyLevel >= 5) ? Colors.blue : Colors.blue[100]
        ),
      ],
    );
  }
}