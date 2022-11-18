import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class winner extends StatelessWidget {
  String _winner;
  winner(this._winner);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Winner"),
      content: Container(
        child: Column(
          children: [
            Text(_winner),
            Text("Winner Winner Chicken Dinner"),
          ],
        ),
      ),
    );
  }
}
