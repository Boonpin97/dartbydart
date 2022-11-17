import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/game.dart';
import '/class/players.dart';
import '/Test.dart';

void main() {
  List<Players> _Players = [
    Players("Boon Pin"),
    Players("Wilson"),
    Players("Raymond")
  ];
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      "/home": (context) => Home(_Players),
      "/game": (context) => Game(_Players),
    },
  ));
}
