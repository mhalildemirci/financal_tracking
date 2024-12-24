import 'package:financal_tracking/CategorySelectionScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String monthlyIncome; // Kullanıcıdan alınan maaş bilgisi
  const HomeScreen({Key? key, required this.monthlyIncome}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _spendings = [];
  late double remainingBalance;

  @override
  void initState() {
    super.initState();
    remainingBalance = double.parse(widget.monthlyIncome.replaceAll(' \$', ''));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Maaş bilgisi kartı
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: screenSize.height * 0.27,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 25, 17, 173),
                    Color.fromARGB(255, 46, 127, 227)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${remainingBalance.toStringAsFixed(2)} \$",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            // SelectScreen'e geçiş
                            Navigator.pop(context); // Önceki sayfaya döner.
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Your Spendings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _spendings.length,
              itemBuilder: (context, index) {
                final spending = _spendings[index];
                return Card(
                    child: ListTile(
                  leading: Icon(spending['icon'] as IconData),
                  title: Text(spending['category'] as String),
                  subtitle: Text(
                    "${spending['amount']} \$",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategorySelectionScreen(),
            ),
          );
          if (result != null) {
            setState(() {
              _spendings.add(result);
              remainingBalance -= result['amount'] as double;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
