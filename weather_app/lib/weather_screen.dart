import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App', 
          style: TextStyle(
          fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
          actions:  [
            IconButton(onPressed: (){
              
            }, 
            icon: const Icon(Icons.refresh),
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //main card 
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Text('300°K',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 16),
                    Icon(Icons.cloud, size: 64,),
                    const SizedBox(height: 16),
                    Text('Rain',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    )
                  ],
                  ),
                ),
              ),
            ),
            //weather forecast cards
            const SizedBox(height: 20),
            const Placeholder(
              fallbackHeight: 150,
            ),
            const SizedBox(height: 20),
            //additional information
            const Placeholder(
              fallbackHeight: 150,
            ),
          ],
        ),
      ),
    );
  }
}