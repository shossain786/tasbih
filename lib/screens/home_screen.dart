import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasbih/appdrawer.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/dua1.dart';
import 'package:tasbih/screens/durud_sharif.dart';
// import 'package:tasbih/screens/shab_e_berat.dart';
import 'package:tasbih/utils/library_utils.dart';

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

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> item = getRandomItem();

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
              Card(
                shadowColor: Colors.blue,
                elevation: 3.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Visibility(
                          visible: item['subtitle'].toString().isNotEmpty,
                          child: const SizedBox(height: 10),
                        ),
                        Visibility(
                          visible: item['subtitle'].toString().isNotEmpty,
                          child: Text(
                            item['subtitle'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          visible: item['hawala'].toString().isNotEmpty,
                          child: Text(
                            item['hawala'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
              Card(
                elevation: 3.0,
                shadowColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CounterHome(),
                                    ),
                                  );
                                },
                                child: const Text('Go To Tasbih'),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DuaScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: const Text('Duain'),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ShabeBaraatScreen(),
                              //       ),
                              //     );
                              //   },
                              //   style: ButtonStyle(
                              //     backgroundColor:
                              //         MaterialStateProperty.all(Colors.orange),
                              //     elevation: const MaterialStatePropertyAll(4),
                              //     shadowColor:
                              //         MaterialStateProperty.all(Colors.blue),
                              //     foregroundColor:
                              //         MaterialStateProperty.all(Colors.black),
                              //   ),
                              //   child: const Text('Shab E Barat'),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
