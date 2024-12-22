import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String monthlyIncome; // Kullanıcıdan alınan maaş bilgisi
  const HomeScreen({Key? key, required this.monthlyIncome}) : super(key: key);

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
                      "You Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$monthlyIncome",
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
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            // StatisticsScreen'e geçiş
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StatisticsScreen()),
                            );
                          },
                          icon:
                              const Icon(Icons.bar_chart, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Harcama bilgisi ve ekleme düğmeleri
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Harcama bilgisi görme aksiyonu
                  },
                  icon: const Icon(Icons.info_outline, color: Colors.black),
                  label: const Text(
                    "You spend information",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Harcama ekleme ekranına geçiş
                  },
                  icon:
                      const Icon(Icons.add_circle_outline, color: Colors.black),
                  label: const Text(
                    "Add spend info",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          // Gelecekte harcama listesi buraya eklenecek
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Text(
                "No spending records yet!",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy StatisticsScreen widget
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics Screen")),
      body: const Center(child: Text("This is the Statistics Screen")),
    );
  }
}
