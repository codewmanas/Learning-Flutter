import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPage extends StatelessWidget {

  const CurrencyConvertorMaterialPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('0',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Amount in INR',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                prefixIcon: Icon(
                  Icons.monetization_on,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              keyboardType:  TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
            ),
          ),
          TextButton(onPressed: () {
            print('Button Clicked');
          }, 
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            textStyle: WidgetStateProperty.all(
              TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              
            ),
          ),
          child: const Text('Convert'),
          ),
          
        ],
      ),
      ),
    );

  }
}
