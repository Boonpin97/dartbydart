import 'package:flutter/material.dart';

class modeButton extends StatelessWidget {
  final int _score;
  final Function _functionHandler;
  final int _Mode;

  modeButton(this._score, this._functionHandler, this._Mode);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _functionHandler(_score),
      style: ElevatedButton.styleFrom(
          backgroundColor:
              (_score == _Mode) ? Colors.green[700] : Colors.grey[600]),
      child: Text(
        "$_score",
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
