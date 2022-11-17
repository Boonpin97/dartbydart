import 'package:flutter/material.dart';


class nextPlayerButton extends StatelessWidget {

  VoidCallback _nextPlayerPressed;
  nextPlayerButton(this._nextPlayerPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  _nextPlayerPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.green[700]),
      child: Text(
        "NEXT",
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}