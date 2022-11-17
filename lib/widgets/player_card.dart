import 'package:flutter/material.dart';
import '/class/players.dart';


class playerCard extends StatelessWidget {
  Players _Players;
  String _Current_Player;
  playerCard(this._Players, this._Current_Player);

  @override
  Widget build(BuildContext context) {

    var _playerTurnColor = Colors.yellow;
    var _notTurnColor = Colors.white;
    return Expanded(
      child: Container(
        height: 150,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(1, 1, 1, 0),
              color: (_Current_Player == _Players.name) ? _playerTurnColor : _notTurnColor,
              height: 35,
              alignment: Alignment.center,
              child: Text(
                _Players.name,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
              color: (_Current_Player == _Players.name)
                  ? _playerTurnColor
                  : _notTurnColor,
              height: 50,
              alignment: Alignment.topCenter,
              child: Text(
                "${_Players.current_score}",
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                    color:(_Current_Player == _Players.name) ? _playerTurnColor : _notTurnColor,
                    height: 30,
                    alignment: Alignment.topCenter,
                    child: Text(
                      "High",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                    color: (_Current_Player == _Players.name) ? _playerTurnColor : _notTurnColor,
                    height: 30,
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Avg",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                    color: (_Current_Player == _Players.name) ? _playerTurnColor : _notTurnColor,
                    height: 30,
                    alignment: Alignment.topCenter,
                    child: Text(
                      "${_Players.highest_score}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                    color: (_Current_Player == _Players.name) ? _playerTurnColor : _notTurnColor,
                    height: 30,
                    alignment: Alignment.topCenter,
                    child: Text(
                      "${_Players.avg_score}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
