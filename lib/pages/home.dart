import 'package:flutter/material.dart';
import '/widgets/row_buttons.dart';
import '/widgets/player_list.dart';
import '/widgets/go_button.dart';
import '/class/players.dart';

int _Mode = 301;

class Home extends StatefulWidget {
  @override
  List<Players> _Players;
  Home(this._Players);
  _HomeState createState() => _HomeState(_Players);
}

class _HomeState extends State<Home> {
  List<Players> _Players;
  _HomeState(this._Players);
  var Controller = TextEditingController();

  void _modeButtonFunction(int mode) {
    setState(() {
      _Mode = mode;
    });
  }

  void _removeName(int index) {
    setState(() {
      _Players.removeAt(index);
    });
  }

  void _addButtonFunction() {
    print("This function is triggered");
    if (_Players.length < 4) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 700,
            color: Colors.blue[500],
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      const Text(
                        "Enter your name:",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      TextFormField(
                        maxLength: 11,
                        controller: Controller,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[200],
                          ),
                          hintText: "Handsomeboi69",
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 50,
                        width: 100,
                        color: Colors.green[500],
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(Icons.check),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                            if (Controller.text.isNotEmpty) {
                              _Players.add(Players(
                                Controller.text,
                              ));
                              setState(() {
                                Controller.text = "";
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        title: const Text(
          "DartByDart",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: <Widget>[
              playerList(_Players, _addButtonFunction, _removeName),
              rowButtons(_modeButtonFunction, _Mode),
              goButton(_Players, _Mode),
            ],
          ),
        ),
      ),
    );
  }
}
