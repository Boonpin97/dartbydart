import 'package:flutter/material.dart';

class goButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
          child: Text(
            "GO",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )),
    );
  }
}
