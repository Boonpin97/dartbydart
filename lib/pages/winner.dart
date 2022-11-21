import 'package:flutter/material.dart';

Map<dynamic, dynamic> data = {"name": ""};
String _winner = "";

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
              Text(
                _winner,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 330,
                child: Text(
                  "WINNER WINNER CHICKEN DINNER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
