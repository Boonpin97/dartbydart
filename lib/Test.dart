import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: DemoIconButton(),
      ),
    );
  }
}

class DemoIconButton extends StatefulWidget {
  @override
  _DemoIconButtonState createState() => _DemoIconButtonState();
}

class _DemoIconButtonState extends State<DemoIconButton> {
  Color _color = Colors.green;

  void _updateColor(Color color) {
    if (mounted) setState(() => _color = color);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: true,
      onEnter: (_) => _updateColor(Colors.purple),
      onExit: (_) => _updateColor(Colors.green),
      child: GestureDetector(
        onTapDown: (_) => _updateColor(Colors.yellow),
        onTapUp: (_) => _updateColor(Colors.green),
        onTapCancel: () => print('cancel :c'),
        key: UniqueKey(),
        child: Icon(
          Icons.phone_locked,
          color: _color,
        ),
      ),
    );
  }
}
