// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
// import 'package:tasbih/screens/dua_details_screen.dart';
import 'package:tasbih/utils/library_utils.dart';

class Dua {
  final String id;
  final String name;
  final String subtitle;
  final String details;
  final String category;
  final String tarjumah;
  final String ahadees;
  final String hawala;

  Dua({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.details,
    required this.category,
    required this.tarjumah,
    required this.ahadees,
    required this.hawala,
  });

  factory Dua.fromJson(Map<String, dynamic> json) {
    return Dua(
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
  late List<Dua> duas = [];

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
        duas = items.map((item) => Dua.fromJson(item)).toList();
      });
    } else {
      debugPrint("Error: Data format is incorrect. 'items' key not found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Masnoon', 'Duain'),
      body: ListView.builder(
        itemCount: duas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(2),
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
                duas[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(duas[index].subtitle),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     // builder: (context) => DuaDetailsScreen(dua: duas[index]),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
