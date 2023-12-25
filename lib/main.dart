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
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
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
        title: const Text('Tasbih App'),
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
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/madina_pic.png',
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const Card(
              child: ListTile(
                title: Text(
                  'Hadise Paak:  Jo mujh par durud padhna bhul gaya woh jannat ki rah bhul gaya!',
                ),
                subtitle: Text(
                    'صلی اللہ علیہ والہ وسلم(Swallellaho alayhi wa aalihi sallam)'),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              elevation: 20,
              color: Color.fromARGB(255, 218, 244, 176),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.deepPurple)),
              child: SizedBox(
                width: 400,
                height: 40,
                child: Center(
                  child: Text(
                    'Shab e Juma ki durud sharif',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 2, 17),
                    ),
                  ),
                ),
              ),
            ),
            Image.asset('assets/juma_durud.png'),
          ],
        ),
      ),
    );
  }
}
