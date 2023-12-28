import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbih/count_page.dart';

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
      appBar: AppBar(
        title: const Text('Tasbih Items'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index]?['text'],
                  ),
                  subtitle: Text(
                    'Target Count: ${items[index]?['${items[index]?['text']}_targetCount']}',
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      _removeItem(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () {
                    _navigateToCountPage(items[index]?['text']);
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                _addItems();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                'Add Tasbih',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
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
          title: const Text('New Tasbih'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Column(
            children: [
              TextField(
                // onChanged: (value) => newItem,
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
                decoration: const InputDecoration(labelText: 'Target Count'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
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
              child: const Text('Save'),
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
                    print("Error decoding item: $e");
                    return null;
                  }
                },
              )
              .where((item) => item != null)
              .toList();
        },
      );
    } catch (e) {
      print("Error loading items: $e");
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
