import 'package:flutter/material.dart';

class CategorySelectionScreen extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategorySelectionScreen({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": Icons.local_taxi, "label": "Taxi"},
      {"icon": Icons.directions_bus, "label": "Transport"},
      {"icon": Icons.restaurant, "label": "Restaurant"},
      {"icon": Icons.medical_services, "label": "Drugs"},
      {"icon": Icons.computer, "label": "Digital Product"},
      {"icon": Icons.beach_access, "label": "Vacation"},
      {"icon": Icons.school, "label": "Education"},
      {"icon": Icons.shopping_cart, "label": "Market"},
      {"icon": Icons.sports, "label": "Sport"},
      {"icon": Icons.brush, "label": "Personal Care"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Category"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              onCategorySelected(category['label'] as String);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category['icon'] as IconData, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    category['label'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
