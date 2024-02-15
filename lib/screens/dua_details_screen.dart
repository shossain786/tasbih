import 'package:flutter/material.dart';
import 'package:tasbih/screens/dua.dart';

class DuaDetailsScreen extends StatelessWidget {
  final Dua dua;

  const DuaDetailsScreen({Key? key, required this.dua}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dua.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dua.subtitle,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10),
            Text(
              dua.details,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
