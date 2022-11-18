import 'package:flutter/material.dart';

class nextPlayerButton extends StatelessWidget {
  VoidCallback _nextPlayerPressed;
  nextPlayerButton(this._nextPlayerPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      color: Colors.green[700],
      child: IconButton(
        onPressed: _nextPlayerPressed,
        color: Colors.white,
        iconSize: 40,
        alignment: Alignment.center,
        icon: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
