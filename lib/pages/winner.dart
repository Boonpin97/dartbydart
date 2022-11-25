import 'package:dartbydart/pages/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Map<dynamic, dynamic> data = {"name": ""};
List<String> _winner = [];

const String image_path = "assets/chickendinner.png";

class winnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    _winner = data["name"];
    print("winner page: $_winner");
    return Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          title: Text(
            "WINNER!",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Row(children: [
                ..._winner
                    .map((players) => Expanded(
                          child: Text(
                            players,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60 / pow(_winner.length, 0.5),
                              color: Colors.white,
                            ),
                          ),
                        ))
                    .toList(),
              ]),
              SizedBox(
                width: 330,
                child: Image.asset(image_path),
              ),
            ],
          ),
        ));
  }
}
