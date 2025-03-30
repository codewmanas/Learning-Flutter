import 'package:flutter/material.dart';

void main() {
  runApp(CakesApp());
}

class CakesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cakes Store",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home - Cakes Store")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Manas Cake Store!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Delicious cakes for every occasion!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProductsScreen()));
              },
              child: Text("View Products"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OrderScreen()));
              },
              child: Text("Place an Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// Products Screen
class ProductsScreen extends StatelessWidget {
  final List<Map<String, String>> cakes = [
    {"name": "Chocolate Cake", "desc": "Rich and creamy chocolate delight"},
    {"name": "Strawberry Cake", "desc": "Fresh and fruity strawberry treat"},
    {"name": "Vanilla Cake", "desc": "Classic vanilla goodness"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Cakes")),
      body: ListView.builder(
        itemCount: cakes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(cakes[index]["name"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(cakes[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}

// Order Screen
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? selectedCake;
  int quantity = 1;
  double totalPrice = 0.0;

  final Map<String, double> cakePrices = {
    "Chocolate Cake": 500.0,
    "Strawberry Cake": 450.0,
    "Vanilla Cake": 400.0,
  };

  void calculateTotal() {
    if (selectedCake != null && quantity > 0) {
      setState(() {
        totalPrice = cakePrices[selectedCake]! * quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Your Cake")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text("Select a Cake"),
              value: selectedCake,
              isExpanded: true,
              items: cakePrices.keys.map((String cake) {
                return DropdownMenuItem<String>(
                  value: cake,
                  child: Text(cake),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCake = newValue;
                  totalPrice = 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Quantity"),
              onChanged: (value) {
                setState(() {
                  quantity = int.tryParse(value) ?? 1;
                  totalPrice = 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTotal,
              child: Text("Calculate Total"),
            ),
            SizedBox(height: 20),
            Text(
              "Total Price: ₹${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}