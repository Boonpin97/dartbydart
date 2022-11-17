import 'package:flutter/material.dart';

List<int> score = [0, 0, 0];

class pointButtonRow extends StatelessWidget {
  @override
  int _input_score = 0;
  int _current_dart;

  pointButtonRow(this._input_score, this._current_dart);

  Widget build(BuildContext context) {
    score[_current_dart] = _input_score;
    return Container(
      color: Colors.white,
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          pointButton("${score[0]}", _current_dart == 0),
          pointButton("${score[1]}", _current_dart == 1),
          pointButton("${score[2]}", _current_dart == 2),
        ],
      ),
    );
  }
}

class pointButton extends StatelessWidget {
  String _text;
  bool _trenary;
  pointButton(this._text, this._trenary);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: TextButton(
          onPressed: () {},
          child: Text(
            _text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50,
              //color: (_trenary) ? Colors.green : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
