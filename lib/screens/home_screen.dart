import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasbih/appdrawer.dart';
import 'package:tasbih/screens/durud_sharif.dart';
import 'package:tasbih/utils/kalma_card.dart';
import 'package:tasbih/utils/library_utils.dart';

import '../utils/hadis_display.dart';
import '../utils/navigation_btns.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_files/maqsus_hadis.json');
    final decodedData = json.decode(data);
    if (decodedData is List) {
      setState(() {
        items = decodedData.cast<Map<String, dynamic>>();
      });
    }
  }

  Map<String, dynamic> getRandomItem() {
    if (items.isEmpty) return {};
    Random random = Random();
    return items[random.nextInt(items.length)];
  }

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 18.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Tasbih', 'APP'),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
          child: Column(
            children: [
              Image.asset(
                'assets/madina_pic.png',
                width: double.infinity,
              ),
              const SizedBox(height: 4),
              HadisBanner(items: items),
              const SizedBox(height: 4),
              const KalmaShariff(),
              const SizedBox(height: 4),
              const Card(
                elevation: 3.0,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: NavigateBtns(),
              ),
              const SizedBox(height: 4),
              const Card(
                elevation: 3,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
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
              const SizedBox(height: 1),
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
      ),
    );
  }
}
