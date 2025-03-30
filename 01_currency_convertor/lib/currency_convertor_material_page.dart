import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPage extends StatefulWidget {
  const CurrencyConvertorMaterialPage({super.key});

  @override
  State<CurrencyConvertorMaterialPage> createState() => _CurrencyConvertorMaterialPageState();
}

class _CurrencyConvertorMaterialPageState extends State<CurrencyConvertorMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'INR $result',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Enter Amount in INR',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: Icon(Icons.monetization_on, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  result = double.parse(textEditingController.text) * 87 ;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                textStyle: WidgetStateProperty.all(
                  TextStyle(color: Colors.black, fontSize: 20),
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
