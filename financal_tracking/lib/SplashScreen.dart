import 'package:financal_tracking/SelectScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Linear Gradient Arkaplan
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF49CBFF), // Sol alt köşe rengi
                  Color(0xFF4524FF), // Sağ üst köşe rengi
                ],
              ),
            ),
          ),

          // Sol Alt Köşe Daireler
          Positioned(
            left: -screenSize.width * 0.2,
            bottom: -screenSize.height * 0.2,
            child: CircleWithShadow(
              color: Color.fromARGB(255, 55, 65, 251), // Daha kontrast renk
              size: screenSize.width * 0.6,
            ),
          ),
          Positioned(
            left: screenSize.width * 0.07,
            bottom: screenSize.height * 0.01,
            child: CircleWithShadow(
              color: Color.fromARGB(255, 69, 75, 254), // Daha kontrast renk
              size: screenSize.width * 0.5,
            ),
          ),
          Positioned(
            left: screenSize.width * 0.05,
            bottom: -screenSize.height * 0.2,
            child: CircleWithShadow(
              color: Color(0xFF467BFE), // Daha kontrast renk
              size: screenSize.width * 0.55,
            ),
          ),

          // Yazı ve Ok İkonu
          Positioned(
            top: screenSize.height * 0.4,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Yazı
                Text(
                  'start manage your money',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10), // Yazı ve ikon arasındaki boşluk
                // Ok İkonu
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 28,
                ),
              ],
            ),
          ),

          // Tıklama Alanı
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectScreen()),
                );
              },
              behavior: HitTestBehavior
                  .translucent, // Tıklamaların alttaki widget'lara geçmesini sağlar
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Circle Widget with Shadow
class CircleWithShadow extends StatelessWidget {
  final Color color;
  final double size;

  const CircleWithShadow({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.3), // Gölgeyi biraz daha belirgin hale getirdik
            blurRadius: 15,
            offset: Offset(8, 8),
          ),
        ],
      ),
    );
  }
}
