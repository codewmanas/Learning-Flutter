import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* 
Types of Widgets:
1. StatelessWidget - data is immutable 
2. StatefulWidget
*/

// State Refers to Any data that Determines how your widget should look like
// how it would render or how it should behave

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center( 
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

// Material Design - Google's Design Language
// Cupertino Design - Apple's Design Language
