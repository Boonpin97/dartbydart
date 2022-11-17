import 'package:dartbydart/widgets/player_card.dart';
import 'package:flutter/material.dart';
import '/class/players.dart';

class goButton extends StatelessWidget {
  List<Players> _Players;
  int _Mode;
  goButton(this._Players, this._Mode);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _Players.length != 0
            ? () {
                for (int i=0; i<_Players.length; i++){
                  _Players[i].current_score = _Mode;
                }
                Navigator.pushNamed(context, "/game");
              }
            : null,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
        child: Text(
          "GO",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
