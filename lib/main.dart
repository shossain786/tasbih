import 'package:flutter/material.dart';
import 'package:tasbih/counter_items.dart';

void main() {
  runApp(const TasbihAPP());
}

class TasbihAPP extends StatelessWidget {
  const TasbihAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        '/counter': (context) => const CounterHome(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Tasbih'),
              onTap: () {
                Navigator.pushNamed(context, '/counter');
              },
            ),
            const ListTile(
              title: Text('About US'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Counter Home Screen!',
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(253, 2, 128, 2),
          ),
        ),
      ),
    );
  }
}
