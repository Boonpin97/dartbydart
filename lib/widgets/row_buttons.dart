import 'package:flutter/material.dart';
import 'package:firstapp/widgets/mode_button.dart';

class rowButtons extends StatelessWidget {

  final Function _functionHandler;
  final int _Mode;

  rowButtons(this._functionHandler, this._Mode);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: <Widget>[
          const Expanded(
            flex: 0,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: modeButton(301, _functionHandler, _Mode),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: modeButton(501, _functionHandler, _Mode),
          ),
          const Expanded(
            flex: 0,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
