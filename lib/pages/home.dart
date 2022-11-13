import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firstapp/widgets/row_buttons.dart';
import 'package:firstapp/widgets/player_list.dart';
import 'package:firstapp/widgets/go_button.dart';

int Mode = 301;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Players = [];
  var Controller = TextEditingController();

  void _modeButtonFunction(int mode) {
    setState(() {
      Mode = mode;
    });
  }

  void _removeName(int index) {
    setState(() {
      Players.removeAt(index);
    });
  }

  void _addButtonFunction() {
    print("This function is triggered");
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600,
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
                          Players.add(Controller.text);
                          setState(() {
                            Controller.text = "";
                          });
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
          margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Column(
            children: <Widget>[
              playerList(Players, _addButtonFunction, _removeName),
              rowButtons(_modeButtonFunction, Mode),
              goButton(),
            ],
          ),
        ),
      ),
    );
  }
}
