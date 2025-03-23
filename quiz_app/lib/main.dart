import 'package:flutter/material.dart';


int marks = 0;
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => HTMLQuiz(),
        '/third': (context) => ScoreScreen(),
      },
    );
  }
}


class FirstScreen extends StatefulWidget {
  _FirstScreenState createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Center(
          child: const Text(
              'Select bottomnavigationBar option to launch the HTML Quiz',
              style: TextStyle(fontSize: 30)),
        );
      case 1:
        return new HTMLQuiz();
      case 2:
        return new ScoreScreen();


      default:
        return new Text("Error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start QUIZ'),
      ),
      body: _getDrawerItemWidget(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Quiz",
            icon: Icon(Icons.quiz_outlined),
          ),
          BottomNavigationBarItem(
              label: "Scores", icon: Icon(Icons.score_rounded))
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}


// Create the state for the RadioListTile example
class HTMLQuiz extends StatefulWidget {
  @override
  _HTMLQuizState createState() => _HTMLQuizState();
}


class _HTMLQuizState extends State<HTMLQuiz> {
  // Create a variable to store the selected value
  int? _selectedValueQ1;
  String _answer = "";
  void __displayanswer() {
    setState(() {
      if (_selectedValueQ1 == 2) {
        _answer = "RIGHT";
        marks = marks + 5;
      } else {
        _answer = "WRONG";
        marks = marks + 0;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Quiz'), // Set the title of the app bar
      ),
      body: ListView(
        children: <Widget>[
          // Create a RadioListTile for option 1
          Text(
            'Which is a text formatting tag?',
            style: const TextStyle(fontSize: 18),
          ),
          RadioListTile(
            title: Text('<img>'),
            subtitle: Text('image tag'),
            value: 1,
            groupValue: _selectedValueQ1,
            onChanged: (value) {
              setState(() {
                _selectedValueQ1 =
                    value!; // Update _selectedValue when option 1 is selected
              });
            },
          ),


          // Create a RadioListTile for option 2
          RadioListTile(
            title: Text('<b>'), // Display the title for option 2
            subtitle: Text('Bold tag'), // Display a subtitle for option 2
            value: 2, // Assign a value of 2 to this option
            groupValue:
                _selectedValueQ1, // Use _selectedValue to track the selected option
            onChanged: (value) {
              setState(() {
                _selectedValueQ1 =
                    value!; // Update _selectedValue when option 2 is selected
              });
            },
          ),


          // Create a RadioListTile for option 3
          RadioListTile(
            title: Text('<hr>'), // Display the title for option 3
            subtitle:
                Text('Horizontal rule'), // Display a subtitle for option 3
            value: 3, // Assign a value of 3 to this option
            groupValue:
                _selectedValueQ1, // Use _selectedValue to track the selected option
            onChanged: (value) {
              setState(() {
                _selectedValueQ1 =
                    value!; // Update _selectedValue when option 3 is selected
              });
            },
          ),
          ElevatedButton(onPressed: __displayanswer, child: Text("Submit")),
          Text(
            '$_answer',
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}


class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULTS'),
      ),
      body: Center(
        child: Text('$marks', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}


