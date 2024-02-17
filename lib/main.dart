import 'package:flutter/material.dart';
import 'package:tasbih/about_us.dart';
import 'package:tasbih/appdrawer.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/dua.dart';
import 'package:tasbih/utils/library_utils.dart';

void main() {
  runApp(const TasbihAPP());
}

class TasbihAPP extends StatelessWidget {
  const TasbihAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const HomePage(),
      routes: {
        '/counter': (context) => const CounterHome(),
        '/duain': (context) => const DuaScreen(),
        '/aboutus': (context) => const AboutUsPage(),
        // '/vibrate': (context) => const MyApp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Tasbih', 'APP'),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
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
                  'Hadise Paak: Jo mujh par durud padhna bhul gaya woh jannat ki rah bhul gaya!',
                ),
                subtitle: Text(
                    'صلی اللہ علیہ والہ وسلم(Swallellaho alayhi wa aalihi wa sallam)'),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              elevation: 20,
              color: Color.fromARGB(255, 104, 252, 64),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.deepPurple),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10))),
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
