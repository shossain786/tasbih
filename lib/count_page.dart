import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountPage extends StatefulWidget {
  final String itemName;

  const CountPage({super.key, required this.itemName});

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  int targetCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Tasbih -',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.itemName,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        foregroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: _resetCount,
            icon: const Icon(Icons.restore),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {
          _incrementCount();
          if (count == targetCount) {
            _showContinuePrompt();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count: $count',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Text('Target Count: $targetCount'),
              const SizedBox(height: 10),
              Image.asset(
                'assets/counter_pic.gif',
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCount() {
    setState(() {
      count++;
      _saveCount();
      if (count == targetCount) {
        _showContinuePrompt();
      }
    });
  }

  Future<void> _showContinuePrompt() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Target Reached'),
          content: const Text(
              'You have reached the target count. Do you want to continue counting?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });
                _saveCount();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    // Navigator.pop(context);
  }

  void _resetCount() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Count'),
          content: const Text('Are you sure you want to reset the count?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  count = 0;
                });
                await _saveCount();
                Navigator.pop(context);
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? listData = prefs.getStringList('items');
    List<dynamic> dataList = jsonDecode(
      listData.toString(),
    );

    setState(
      () {
        count = prefs.getInt('${widget.itemName}_count') ?? 0;
        String targetKey = '${widget.itemName}_targetCount';

        Map<String, dynamic>? targetMap;
        for (Map<String, dynamic> map in dataList) {
          if (map.containsKey(targetKey)) {
            targetMap = map;
            break;
          }
        }
        targetCount = targetMap![targetKey];
      },
    );
  }

  Future<void> _saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('${widget.itemName}_count', count);
    prefs.setInt('${widget.itemName}_targetCount', targetCount);
  }
}
