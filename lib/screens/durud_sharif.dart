import 'package:flutter/material.dart';
import 'package:tasbih/utils/library_utils.dart';

class DurudJuma extends StatelessWidget {
  const DurudJuma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Durud', 'SHARIF'),
      body: const Center(
        child: Text(''),
      ),
    );
  }
}
