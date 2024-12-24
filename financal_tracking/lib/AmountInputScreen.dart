import 'package:flutter/material.dart';

class AmountInputScreen extends StatefulWidget {
  final String category;

  const AmountInputScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<AmountInputScreen> createState() => _AmountInputScreenState();
}

class _AmountInputScreenState extends State<AmountInputScreen> {
  double amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense: ${widget.category}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.category,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (amount > 0) amount -= 1;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                "${amount.toStringAsFixed(2)} \$",
                style: const TextStyle(fontSize: 24),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    amount += 1;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                "category": widget.category,
                "amount": amount,
                "icon": _getCategoryIcon(widget.category),
              });
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    // Kategoriye uygun simgeler döndür
    switch (category) {
      case "Taxi":
        return Icons.local_taxi;
      case "Transport":
        return Icons.directions_bus;
      case "Restaurant":
        return Icons.restaurant;
      case "Drugs":
        return Icons.medical_services;
      case "Digital Product":
        return Icons.computer;
      case "Vacation":
        return Icons.beach_access;
      case "Education":
        return Icons.school;
      case "Market":
        return Icons.shopping_cart;
      case "Sport":
        return Icons.sports;
      case "Personal Care":
        return Icons.brush;
      default:
        return Icons.category;
    }
  }
}
