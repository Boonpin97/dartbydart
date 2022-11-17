import 'package:flutter/material.dart';
import '/class/players.dart';

class playerList extends StatelessWidget {
  List<Players> _Players  = [];
  final VoidCallback _functionHandler;
  final Function _functionHandler2;

  playerList(this._Players, this._functionHandler, this._functionHandler2);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SizedBox(
          height: 600,
          child: Column(
            children: [
              Container(
                height: 550,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _Players.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      color: Colors.blue[700],
                      child: ListTile(
                        onTap: () => _functionHandler2(index),
                        title: Text(
                          _Players[index].name,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: (_Players.length >= 4) ? Colors.grey[700] : Colors.green[700],
                child: IconButton(
                    onPressed: _functionHandler,
                    color:  Colors.white,
                    icon: const Icon(Icons.add),
                    ),
              ),
            ],
          ),
        ));
  }
}
