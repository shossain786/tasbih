// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbih/count_page.dart';
import 'package:tasbih/utils/library_utils.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<StatefulWidget> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  List<Map<String, dynamic>?> items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Tasbih', 'Items'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItems();
        },
        backgroundColor: Colors.orange,
        splashColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: (index % 2 == 1)
                            ? Colors.orangeAccent
                            : Colors.white,
                        border: Border.all(width: 3, color: Colors.blue),
                      ),
                      child: ListTile(
                        leading: Icon(
                          FlutterIslamicIcons.solidTasbihHand,
                          color: MyColors().barIconsColor(),
                        ),
                        title: Text(
                          items[index]?['text'],
                          style: const TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text(
                          'Target Count: ${items[index]?['${items[index]?['text']}_targetCount']}',
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            _removeItem(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: MyColors().deleteIconColor(),
                          ),
                        ),
                        onTap: () {
                          _navigateToCountPage(items[index]?['text']);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCountPage(String itemName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountPage(itemName: itemName),
      ),
    );
  }

  void _addItems() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newItem = '';
        int targetCount = 0;

        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 10.0,
          shadowColor: Colors.orange,
          surfaceTintColor: Colors.blue,
          title: const Text(
            'New Tasbih',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          scrollable: true,
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  newItem = value;
                },
                decoration: const InputDecoration(labelText: 'Tasbih Name'),
              ),
              TextField(
                onChanged: (value) {
                  targetCount = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Target Count',
                  isDense: true,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (newItem.isNotEmpty) {
                  setState(() {
                    items.add({
                      'text': newItem,
                      '${newItem}_targetCount': targetCount
                    });
                  });
                  await _saveItems();
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final itemsList = prefs.getStringList('items') ?? [];

      setState(
        () {
          items = itemsList
              .map(
                (item) {
                  try {
                    Map<String, dynamic> itemMap = json.decode(item);
                    return itemMap;
                  } catch (e) {
                    debugPrint("Error decoding item: $e");
                    return null;
                  }
                },
              )
              .where((item) => item != null)
              .toList();
        },
      );
    } catch (e) {
      debugPrint("Error loading items: $e");
    }
  }

  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsList = items.map((item) => json.encode(item)).toList();
    prefs.setStringList('items', itemsList);
  }

  void _removeItem(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: const Text('Are you sure you want to remove this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Remove the item from the list, save it, and close the dialog
                setState(() {
                  items.removeAt(index);
                });
                await _saveItems();
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }
}
