import 'package:flutter/material.dart';
import 'package:tasbih/screens/dua1.dart';
import 'package:tasbih/utils/library_utils.dart';

class DuaDetailsScreen extends StatelessWidget {
  final Dua1 dua;

  const DuaDetailsScreen({Key? key, required this.dua}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Dua', 'Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4.0,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  child: Column(
                    children: [
                      Text(
                        dua.name,
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
                        dua.details,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: dua.tarjumah.isNotEmpty,
                            child: const Text(
                              'Tarjuma:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        dua.tarjumah,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: dua.ahadees.isNotEmpty,
                            child: const Text(
                              'Hadis:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        dua.ahadees,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: dua.hawala.isNotEmpty,
                            child: const Text(
                              'Hawala:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        dua.hawala,
                        style: const TextStyle(fontSize: 10.0),
                      ),
                      const SizedBox(
                        height: 10,
                      )
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
