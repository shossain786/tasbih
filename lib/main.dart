import 'package:flutter/material.dart';
import 'package:tasbih/about_us.dart';
import 'package:tasbih/appdrawer.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/dua1.dart';
import 'package:tasbih/screens/durud_sharif.dart';
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
        // '/adab': (context) => const AdabOSunnatScreen(),
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
              shadowColor: Colors.blue,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Text(
                  'Hadise Paak: Jo mujh par durud padhna bhul gaya woh jannat ki rah bhul gaya!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    'صلی اللہ علیہ والہ وسلم(Swallellaho alayhi wa aalihi wa sallam)'),
              ),
            ),
            const SizedBox(height: 4),
            const Card(
              elevation: 3,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
              ),
              child: SizedBox(
                // width: ,
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Text(
                    'Shab e Juma ki durud sharif',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              child: Card(
                elevation: 3.0,
                shadowColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/juma_durud.png',
                    width: double.infinity,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DurudJuma(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
