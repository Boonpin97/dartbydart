import 'package:flutter/material.dart';


class pointButtonRow extends StatelessWidget {
  @override
  int _current_dart;
  bool _next_player_flag;
  Function _scoreButtonPressed;
  List<int> score;

  pointButtonRow(this.score, this._current_dart, this._next_player_flag,
      this._scoreButtonPressed);

  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(0),
      color: Colors.grey,
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          pointButton(
              "${score[0]}", _current_dart == 0, 0, _scoreButtonPressed),
          pointButton(
              "${score[1]}", _current_dart == 1, 1, _scoreButtonPressed),
          pointButton(
              "${score[2]}", _current_dart == 2, 2, _scoreButtonPressed),
        ],
      ),
    );
  }
}

class pointButton extends StatelessWidget {
  String _text;
  bool _ternary;
  int ind;
  Function _scoreButtonPressed;

  pointButton(this._text, this._ternary, this.ind, this._scoreButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _scoreButtonPressed(ind),
        style: ElevatedButton.styleFrom(
          backgroundColor: _ternary ? Colors.yellow : Colors.white,
        ),
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
