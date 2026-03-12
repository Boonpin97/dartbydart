import 'package:dartbydart/pages/winner.dart';
import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/game.dart';
import '/class/players.dart';

void main() {
  List<Players> players = [
    // Players("Boon Pin"),
    // Players("Wilson"),
    // Players("Raymond"),
  ];
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
    ),
    initialRoute: '/home',
    routes: {
      "/home": (context) => Home(players),
      "/game": (context) => Game(players),
      "/winner": (context) => winnerPage(),
    },
  ));
}
