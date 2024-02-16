import 'package:flutter/material.dart';
import 'package:tasbih/screens/dua.dart';
import 'package:tasbih/utils/library_utils.dart';

class DuaDetailsScreen extends StatelessWidget {
  final Dua dua;

  const DuaDetailsScreen({Key? key, required this.dua}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, dua.name, ''),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    dua.subtitle,
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
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
