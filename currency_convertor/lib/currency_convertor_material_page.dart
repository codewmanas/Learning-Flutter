import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPage extends StatelessWidget {

  const CurrencyConvertorMaterialPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
          TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              label: Text('Enter Amount in INR', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            ),
          ),
        ],
      ),
      ),
    );

  }
}
