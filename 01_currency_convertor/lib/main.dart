import 'package:currency_convertor/currency_convertor_material_page.dart';
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
    return const MaterialApp(
      home: CurrencyConvertorMaterialPage(),
    );
  }
}

// Material Design - Google's Design Language
// Cupertino Design - Apple's Design Language
