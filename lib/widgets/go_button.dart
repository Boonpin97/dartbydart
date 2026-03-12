import 'package:dartbydart/widgets/player_card.dart';
import 'package:flutter/material.dart';
import '/class/players.dart';

class goButton extends StatelessWidget {
  final List<Players> _Players;
  final int _Mode;
  goButton(this._Players, this._Mode, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _Players.isNotEmpty
            ? () {
                for (int i = 0; i < _Players.length; i++) {
                  _Players[i].resetScore(_Mode);
                  print("Reseting ${_Players[i]} 's score");
                }
                Navigator.pushNamed(context, "/game");
              }
            : null,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
        child: const Text(
          "GO",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
