import 'package:flutter/material.dart';

const String image_path = "assets/dartboard.jpg";

class dartBoard extends StatelessWidget {
  final _updateCoordinates;
  final _release;
  dartBoard(this._updateCoordinates, this._release, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.black,
      height: 400,
      width: 400,
      child: Listener(
        onPointerDown: _updateCoordinates,
        onPointerMove: _updateCoordinates,
        onPointerUp: _release,
        child: const CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage(image_path),
        ),
      ),
    );
  }
}
