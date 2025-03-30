import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/drag_details.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyState createState() => _MyState();
}


class _MyState extends State<MyApp> {
  Color _containerColor = Colors.yellow;


  void changeColor(DragUpdateDetails details) {
    setState(() {
      if (_containerColor == Colors.yellow) {
        _containerColor = Colors.red;
        return;
      }
      _containerColor = Colors.yellow;
      return;
    });
  }


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text("A Simple App Stateful Widget")),
            body: GestureDetector(
              onHorizontalDragUpdate: changeColor,
              child: Container(
                // width: 200,
                // height: 200,
                color: _containerColor,
                child: Center(
                  child: Text(
                    "Tap Me!",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            )
)
);
  }
}


