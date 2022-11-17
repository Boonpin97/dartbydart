import 'package:flutter/material.dart';

const String image_path = "assets/dartboard.jpg";

class dartBoard extends StatelessWidget {
  var _updateCoordinates;
  var _release;
  dartBoard(this._updateCoordinates, this._release);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      height: 400,
      width: 400,
      child: Listener(
        onPointerDown: _updateCoordinates,
        onPointerMove: _updateCoordinates,
        onPointerUp: _release,
        child: CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage(image_path),
        ),
      ),
    );
  }
}
