import 'package:flutter/material.dart';
import 'package:tasbih/model/namaaz.dart';
import 'package:tasbih/utils/library_utils.dart';

class NamaazDetails extends StatelessWidget {
  final Namaaz namaaz;

  const NamaazDetails({Key? key, required this.namaaz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Namaaz', 'Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Column(
            children: [
              Text(
                namaaz.sawal,
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
                namaaz.jawab,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: namaaz.hawala.isNotEmpty,
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
            ],
          ),
        ),
      ),
    );
  }
}
