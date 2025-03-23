import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Validation Demo')),
        body: MyCustomForm(),
      ),
    );
  }
}


// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}


class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          CheckboxListTile(
            title: const Text('I agree to subscribe'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
                _errorText = null;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: isChecked
                ? () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  }
                : null,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
