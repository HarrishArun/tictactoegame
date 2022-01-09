import 'package:flutter/material.dart';

class increment extends StatefulWidget {
  const increment({Key? key}) : super(key: key);

  @override
  _incrementState createState() => _incrementState();
}

class _incrementState extends State<increment> {
  int _counter = 0;
  void _winCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
