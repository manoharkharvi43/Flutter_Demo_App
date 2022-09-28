import 'dart:async';

import 'package:flutter/cupertino.dart';

class CounterDisplay extends StatefulWidget {
  const CounterDisplay({Key? key , }) : super(key: key);

  @override
  _CounterDisplayState createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello "),
    );
  }
}
