import 'package:flutter/material.dart';
import 'package:tasbih/about_us.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/coming_soon.dart';
import 'package:tasbih/screens/dua1.dart';
import 'package:tasbih/screens/namaz_screen.dart';
import 'package:tasbih/screens/shab_e_berat.dart';

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
        '/shabebarat': (context) => const ShabeBaraatScreen(),
        '/adab': (context) => const ComingSoonPage(),
        '/namaz': (context) => const NamaazScreen(),
        '/fatiha': (context) => const ComingSoonPage(),
      },
    );
  }
}
