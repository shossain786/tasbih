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
          child: Card(
            child: Column(
              children: [
                Text(
                  namaaz.sawal,
                  textAlign: TextAlign.center,
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
                Column(
                  children: [
                    const Text(
                      'بِسْمِ ٱللّٰهِ ٱلرَّحْمٰنِ ٱلرَّحِيْمِ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 88, 33),
                        shadows: [
                          Shadow(
                            color: Colors.amber,
                            blurRadius: 50,
                            offset: Offset(10.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      namaaz.jawab,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.orange,
                  thickness: 2.0,
                ),
                Visibility(
                  visible: namaaz.hawala.isNotEmpty,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Hawala:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        namaaz.hawala,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
