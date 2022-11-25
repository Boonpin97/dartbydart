import 'dart:math';

import 'package:dartbydart/widgets/point_buttons_row.dart';
import 'package:flutter/material.dart';
import '/widgets/player_card.dart';
import '/class/players.dart';
import '/widgets/dart_board.dart';
import '/widgets/next_player.dart';
import '/pages/winner.dart';

double device_width = 0;
double device_height = 0;

const String image_path = "assets/dartboard.jpg";
const double _radius = 132.0;
const double _center_x = 200.0;
const double _center_y = 200.0;
const pi = 3.1415;
const List<double> ratio = [0.08333, 0.5606, 0.6288, 0.9167, 1];
const List<int> score_seq = [
  6,
  10,
  15,
  2,
  17,
  3,
  19,
  7,
  16,
  8,
  11,
  14,
  9,
  12,
  5,
  20,
  1,
  18,
  4,
  13,
  6
];

class Game extends StatefulWidget {
  List<Players> _Players;

  Game(this._Players);
  @override
  _GameState createState() => _GameState(_Players);
}

class _GameState extends State<Game> {
  List<Players> _Players;
  _GameState(this._Players);
  int _current_dart = 0;
  int _current_player = 0;
  int _current_round = 1;
  bool _auto_next_flag = true;
  bool _next_player_flag = false;
  List<int> _score_list = [0, 0, 0, 0];

  _scoreButtonPressed(ind) {
    _current_dart = ind;
    setState(() {});
  }

  _nextPlayerPressed() {
    int total_score = 0;
    for (int i = 0; i < _score_list.length - 1; i++) {
      total_score += _score_list[i];
      _Players[_current_player].appendScore(_score_list[i]);
    }
    if (total_score <= _Players[_current_player].current_score &&
        _Players[_current_player].current_score - total_score != 1) {
      _Players[_current_player].current_score -= total_score;
    }

    if (_Players[_current_player].current_score == 0) {
      print("Winner: ${_Players[_current_player].name}");
      Navigator.pushReplacementNamed(context, "/winner",
          arguments: {'name': _Players[_current_player].name});
    }

    _current_player += 1;
    _current_dart = 0;
    _auto_next_flag = true;
    _next_player_flag = true;
    _score_list = [0, 0, 0, 0];
    if (_current_player >= _Players.length) {
      _current_round += 1;
      _current_player = 0;
      if (_current_round > 10) {
        int min_score = 501;
        List<String> min_player = [];
        for (int i = 0; i < _Players.length; i++) {
          if (_Players[i].current_score <= min_score) {
            if (_Players[i].current_score != min_score) {
              min_player = [];
            }
            min_score = _Players[i].current_score;
            min_player.add(_Players[i].name);
          }
        }
        print("List score: $min_player");
        //print("Winner is ${_Players[min_player].name}");
        Navigator.pushReplacementNamed(context, "/winner",
            arguments: {'name': min_player});
      }
    }

    setState(() {});
  }

  _release(PointerUpEvent details) {
    print("Finger Released");
    if (_auto_next_flag == true) {
      _current_dart += 1;
      if (_current_dart > 3) {
        _current_dart = 0;
      } else if (_current_dart > 2) {
        _auto_next_flag = false;
      } else {
        _score_list[_current_dart] = 0;
      }
    }

    setState(() {});
  }

  _updateCoordinates(PointerEvent details) {
    double x = details.localPosition.dx;
    double y = details.localPosition.dy;
    //double y = details.position.dy + 20;
    double delta_x = x - _center_x;
    double delta_y = y - _center_y;
    double length = sqrt(pow(delta_x, 2) + pow(delta_y, 2));
    double theta = atan(delta_y / delta_x);
    int score;
    if (x < _center_x) {
      //2nd and 3rd Quadrant
      theta += pi;
    } else if (x > _center_x && y < _center_y) {
      theta += 2 * pi;
    }
    int index = (theta / (pi / 10)).round();
    score = score_seq[index];
    double normalise_length = length / _radius;
    if (normalise_length < ratio[0])
      score = 50;
    else if (normalise_length > ratio[1] && normalise_length < ratio[2])
      score *= 3;
    else if (normalise_length > ratio[3] && normalise_length < ratio[4])
      score *= 2;
    else if (normalise_length > ratio[4]) score = 0;
    print(
        "x: $x, y: $y, length:$length theta:$theta index: $index, score: $score, score list: $_score_list");
    _score_list[_current_dart] = score;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          title: Text(
            "Round $_current_round",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Row(children: [
              ..._Players.map((players) =>
                  playerCard(players, _Players[_current_player].name)).toList(),
            ]),
            SizedBox(
              height: 10,
            ),
            dartBoard(_updateCoordinates, _release),
            SizedBox(
              height: 10,
            ),
            pointButtonRow(_score_list, _current_dart, _next_player_flag,
                _scoreButtonPressed),
            SizedBox(
              height: 10,
            ),
            nextPlayerButton(_nextPlayerPressed),
          ],
        ));
  }
}
