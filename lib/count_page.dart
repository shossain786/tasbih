// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CountPage extends StatefulWidget {
  final String itemName;

  const CountPage({Key? key, required this.itemName}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  int targetCount = 0;
  int totalCount = 0;
  static const int totalDots = 100;

  late bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void initState() {
    super.initState();
    _loadCount();
    _init();
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
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
            if (_canVibrate) {
              Vibrate.feedback(FeedbackType.impact);
            }
            _showContinuePrompt();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  _buildCircularDots(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$count/',
                            style: const TextStyle(
                              fontSize: 36,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            '$targetCount',
                            style: const TextStyle(
                              fontSize: 36,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      // Text('$totalCount'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Icon(
                FlutterIslamicIcons.tasbihHand,
                size: 140,
                color: Colors.blue,
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
      totalCount++;
      _saveCount();
      if (count == targetCount) {
        _showContinuePrompt();
      }
    });
  }

  Widget _buildCircularDots() {
    double percentageRemaining =
        targetCount != 0 ? 1 - (count / targetCount) : 1;
    int remainingDots = (percentageRemaining * totalDots).round();

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: List.generate(totalDots, (index) {
          double angle = 2 * pi * index / totalDots;
          double radius = 95;
          double dotRadius = 4;
          return Positioned(
            top: radius * cos(angle) + radius,
            left: radius * sin(angle) + radius,
            child: Container(
              width: dotRadius,
              height: dotRadius,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: index < remainingDots ? Colors.orange : Colors.blue,
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> _showContinuePrompt() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Target Reached',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          elevation: 10.0,
          shadowColor: Colors.orange,
          surfaceTintColor: Colors.blue,
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
  }

  void _resetCount() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10.0,
          shadowColor: Colors.orange,
          surfaceTintColor: Colors.blue,
          title: const Text(
            'Reset Count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
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
        totalCount = prefs.getInt('${widget.itemName}_totalCount') ?? 0;
        String targetKey = '${widget.itemName}_targetCount';

        Map<String, dynamic>? targetMap;
        for (Map<String, dynamic> map in dataList) {
          if (map.containsKey(targetKey)) {
            targetMap = map;
            break;
          }
        }
        targetCount = targetMap![targetKey];
        debugPrint('Target Count: $targetCount');
      },
    );
  }

  Future<void> _saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('${widget.itemName}_count', count);
    prefs.setInt('${widget.itemName}_targetCount', targetCount);
    prefs.setInt('${widget.itemName}_totalCount', totalCount);
    debugPrint(prefs.getKeys().toString());
    debugPrint('${prefs.get('Allahu_count')}');
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dotPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    canvas.drawCircle(center, radius, Paint()..color = Colors.grey);

    for (double i = 0; i < progress * 10; i++) {
      double angle = (2 * pi / 10) * i;
      double x = radius + radius * 0.8 * cos(angle);
      double y = radius + radius * 0.8 * sin(angle);
      canvas.drawPoints(PointMode.points, [Offset(x, y)], dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
