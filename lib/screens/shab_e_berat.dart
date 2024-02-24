import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:tasbih/utils/library_utils.dart';

class ShabeBaraatItem {
  final String id;
  final String title;
  final String details;
  final String hawala;
  final String category;

  ShabeBaraatItem({
    required this.id,
    required this.title,
    required this.details,
    required this.hawala,
    required this.category,
  });

  factory ShabeBaraatItem.fromJson(Map<String, dynamic> json) {
    return ShabeBaraatItem(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      hawala: json['hawala'],
      category: json['category'],
    );
  }
}

class ShabeBaraatScreen extends StatefulWidget {
  const ShabeBaraatScreen({Key? key}) : super(key: key);

  @override
  _ShabeBaraatScreenState createState() => _ShabeBaraatScreenState();
}

class _ShabeBaraatScreenState extends State<ShabeBaraatScreen> {
  late List<ShabeBaraatItem> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json_files/shabebarat.json');
      if (response.isNotEmpty) {
        final List<dynamic> data = json.decode(response)['items'];
        setState(() {
          items = data.map((item) => ShabeBaraatItem.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load JSON file');
      }
    } catch (e) {
      debugPrint('Error loading JSON file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<ShabeBaraatItem>> categories = {};
    for (var item in items) {
      if (!categories.containsKey(item.category)) {
        categories[item.category] = [];
      }
      categories[item.category]!.add(item);
    }

    return DefaultTabController(
      length: categories.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Flexible(
                child: Text(
                  'Shabe',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Barat',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
            dividerColor: Colors.blue,
            dividerHeight: 2.0,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blue,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
            ),
            tabs: categories.keys.map((category) {
              return Tab(text: category);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.keys.map((category) {
            return ListView.builder(
              itemCount: categories[category]?.length,
              itemBuilder: (context, index) {
                final item = categories[category]![index];
                return Card(
                  margin: const EdgeInsets.all(2),
                  elevation: 4.0,
                  shadowColor: MyColors().appBarIconsColor(),
                  color: (index % 2 == 1)
                      ? MyColors().cardIconColor()
                      : MyColors().btnTextColor(),
                  child: ListTile(
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShabEBaratDetailsScreen(shabebaratItem: item),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        FlutterIslamicIcons.crescentMoon,
                        color: MyColors().appBarIconsColor(),
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_right, color: Colors.white),
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

class ShabEBaratDetailsScreen extends StatelessWidget {
  final ShabeBaraatItem shabebaratItem;

  const ShabEBaratDetailsScreen({Key? key, required this.shabebaratItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'ShabEBerat', 'Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4.0,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        shabebaratItem.title,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Text(
                        shabebaratItem.details,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Visibility(
                        visible: shabebaratItem.hawala.isNotEmpty,
                        child: Text(
                          'Hawala: ${shabebaratItem.hawala}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
