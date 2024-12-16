import 'package:financal_tracking/main.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCycle;
  final _incomeController = TextEditingController();

  @override
  void dispose() {
    _incomeController.dispose();
    super.dispose();
  }

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

          // Daireler
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

          // Form
          Center(
            child: SingleChildScrollView(
              // Klavyeyi açarken içeriğin kaymasını sağlar
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Select Monthly Income
                      Text(
                        'select monthly income',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _incomeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'örnek: 3.500 \$',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          if (!value.endsWith(' \$')) {
                            _incomeController.text =
                                value.replaceAll(' \$', '') + ' \$';
                            _incomeController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: _incomeController.text.length - 2),
                            );
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen aylık gelirinizi girin';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 30),

                      // Select Monthly Cycle
                      Text(
                        'select monthly cycle',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Ay gününü seçin',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        value: _selectedCycle,
                        items: List.generate(31, (i) => '${i + 1}')
                            .map<DropdownMenuItem<String>>((String day) {
                          return DropdownMenuItem<String>(
                            value: day,
                            child: Text('$day',
                                style: TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCycle = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen bir gün seçin';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 50),

                      // Continue Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Geçerli değerler ile devam et
                            print('Aylık gelir: ${_incomeController.text}');
                            print('Aylık döngü: $_selectedCycle');
                            // TODO: Bir sonraki sayfaya geç veya işlemleri yap
                          }
                        },
                        child: Text('Continue'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF4524FF),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
