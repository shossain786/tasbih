import 'package:flutter/material.dart';
import 'package:tasbih/about_us.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/dua1.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const TasbihAPP());
}

class TasbihAPP extends StatelessWidget {
  const TasbihAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/counter': (context) => const CounterHome(),
        '/duain': (context) => const DuaScreen(),
        '/aboutus': (context) => const AboutUsPage(),
        // '/adab': (context) => const AdabOSunnatScreen(),
      },
    );
  }
}
