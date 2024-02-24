import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 500.0,
              height: 500.0,
              color: const Color(0xffd1667c),
              alignment: Alignment.center,
              transformAlignment: Alignment.center,
              child: Container(
                color: const Color(0xffd1667c),
                child: Container(
                  width: 165,
                  height: 165,
                  decoration: BoxDecoration(
                    color: const Color(0xffd1667c),
                    borderRadius: BorderRadius.circular(39),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffb3485e),
                        Color(0xffef849a),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffef849a),
                        offset: Offset(20.0, 20.0),
                        blurRadius: 2,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color(0xffb3485e),
                        offset: Offset(-20.0, -20.0),
                        blurRadius: 2,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.star,
                    size: 55,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Container(
              width: 500.0,
              height: 500.0,
              color: const Color(0xffd1667c),
              alignment: Alignment.center,
              transformAlignment: Alignment.center,
              child: Container(
                color: const Color(0xffd1667c),
                child: Container(
                  width: 165,
                  height: 165,
                  decoration: BoxDecoration(
                    color: const Color(0xffd1667c),
                    borderRadius: BorderRadius.circular(39),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffb3485e),
                        Color(0xffef849a),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffef849a),
                        offset: Offset(20.0, 20.0),
                        blurRadius: 2,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color(0xffb3485e),
                        offset: Offset(-20.0, -20.0),
                        blurRadius: 2,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.star,
                    size: 55,
                    color: Colors.amber,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
