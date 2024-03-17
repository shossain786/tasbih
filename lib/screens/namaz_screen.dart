import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasbih/model/namaaz.dart';

class NamaazScreen extends StatefulWidget {
  const NamaazScreen({super.key});

  @override
  State<NamaazScreen> createState() => _NamaazScreenState();
}

class _NamaazScreenState extends State<NamaazScreen> {
  List<Namaaz> namaazs = [];

  @override
  void initState() {
    super.initState();
    loadNamaz();
  }

  Future<void> loadNamaz() async {
    final String response =
        await rootBundle.loadString('assets/json_files/namaaz.json');
    final Map<String, dynamic> data = jsonDecode(response);
    if (data.containsKey('items')) {
      final List<dynamic> items = data['items'];
      setState(() {
        namaazs = items.map((item) => Namaaz.fromJson(item)).toList();
      });
    } else {
      debugPrint('Json format is incorrect.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Namaaz>> groupedNamazs = {};
    for (var namaaz in namaazs) {
      if (!groupedNamazs.containsKey(namaaz.topic)) {
        groupedNamazs[namaaz.topic] = [];
      } else {
        groupedNamazs[namaaz.topic]!.add(namaaz);
      }
    }

    return DefaultTabController(
      length: groupedNamazs.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(children: [
            Text(
              'Namaaz',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '-Malumaat',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
            isScrollable: true,
            dividerColor: Colors.blue,
            dividerHeight: 2.0,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blue,
            tabAlignment: TabAlignment.start,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
            ),
            tabs: groupedNamazs.keys.map(
              (topic) {
                return Tab(
                  text: topic,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
