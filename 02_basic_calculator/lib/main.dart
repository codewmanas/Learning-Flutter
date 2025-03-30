import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _currentInput = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _currentInput = "";
        _operator = "";
        _num1 = 0;
        _num2 = 0;
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        if (_currentInput.isNotEmpty) {
          _num1 = double.parse(_currentInput);
          _operator = value;
          _currentInput = "";
        }
      } else if (value == "=") {
        if (_currentInput.isNotEmpty && _operator.isNotEmpty) {
          _num2 = double.parse(_currentInput);
          switch (_operator) {
            case "+":
              _output = (_num1 + _num2).toString();
              break;
            case "-":
              _output = (_num1 - _num2).toString();
              break;
            case "×":
              _output = (_num1 * _num2).toString();
              break;
            case "÷":
              _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
              break;
          }
          _currentInput = "";
          _operator = "";
        }
      } else {
        _currentInput += value;
        _output = _currentInput;
      }
    });
  }

  Widget _buildButton(String text) {
    return CupertinoButton(
      padding: EdgeInsets.all(16),
      color: CupertinoColors.systemGrey5,
      borderRadius: BorderRadius.circular(8),
      onPressed: () => _buttonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: CupertinoColors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Calculator"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("÷"),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("×"),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("C"),
                    _buildButton("0"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}