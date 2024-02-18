import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:tasbih/screens/dua_details_screen.dart';
import 'package:tasbih/utils/library_utils.dart';

class Dua1 {
  final String id;
  final String name;
  final String subtitle;
  final String details;
  final String category;
  final String tarjumah;
  final String ahadees;
  final String hawala;

  Dua1({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.details,
    required this.category,
    required this.tarjumah,
    required this.ahadees,
    required this.hawala,
  });

  factory Dua1.fromJson(Map<String, dynamic> json) {
    return Dua1(
        id: json['id'],
        name: json['name'],
        subtitle: json['subtitle'],
        details: json['details'],
        category: json['category'],
        ahadees: json["ahadees"] ?? "",
        hawala: json["hawala"],
        tarjumah: json["tarjumah"]);
  }
}

class DuaScreen extends StatefulWidget {
  const DuaScreen({Key? key}) : super(key: key);

  @override
  _DuaScreenState createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  late List<Dua1> duas = [];

  @override
  void initState() {
    super.initState();
    loadDuas();
  }

  Future<void> loadDuas() async {
    final String response =
        await rootBundle.loadString('assets/json_files/dua.json');
    final Map<String, dynamic> data = json.decode(response);

    if (data.containsKey("items")) {
      final List<dynamic> items = data["items"];
      setState(() {
        duas = items.map((item) => Dua1.fromJson(item)).toList();
      });
    } else {
      debugPrint("Error: Data format is incorrect. 'items' key not found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Grouping duas by category
    Map<String, List<Dua1>> groupedDuas = {};
    for (var dua in duas) {
      if (!groupedDuas.containsKey(dua.category)) {
        groupedDuas[dua.category] = [];
      }
      groupedDuas[dua.category]!.add(dua);
    }

    return DefaultTabController(
      length: groupedDuas.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(children: [
            Text(
              'Masnoon',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Duain',
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
            tabs: groupedDuas.keys.map((category) {
              return Tab(
                text: category,
                icon: const Icon(FlutterIslamicIcons.islam),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: groupedDuas.keys.map((category) {
            return ListView.builder(
              itemCount: groupedDuas[category]!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(2),
                  elevation: 4.0,
                  color: (index % 2 == 1)
                      ? MyColors().cardIconColor()
                      : MyColors().btnTextColor(),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        FlutterIslamicIcons.quran2,
                        color: MyColors().appBarIconsColor(),
                      ),
                    ),
                    title: Text(
                      groupedDuas[category]![index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(groupedDuas[category]![index].subtitle),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuaDetailsScreen(
                            dua: groupedDuas[category]![index],
                          ),
                        ),
                      );
                    },
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
