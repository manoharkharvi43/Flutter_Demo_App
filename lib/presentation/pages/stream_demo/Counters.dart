import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/presentation/pages/stream_demo/CounterDisplay.dart';

class Counters extends StatefulWidget {
  const Counters({Key? key}) : super(key: key);

  @override
  _CountersState createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  @override
  int _counter = 0;
  int _streamCounter = 0;
  late StreamController _countController = StreamController();
  late Stream _countStream = _countController.stream;
  void initState() {
    _countStream.listen((event) {
      setState(() {
        _streamCounter = event;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("count is $_streamCounter"),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () =>
                          {_counter++, _countController.sink.add(_counter)},
                      child: Text("Incriment")),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => {
                              _counter = 0,
                              setState(() {
                                _streamCounter = 0;
                              })
                            },
                        child: Text("Clear "))),
                SizedBox(
                  width: 30,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          ],
        ),
      ),
    );
  }
}
