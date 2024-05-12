import 'package:flutter/material.dart';

import '../counter_items.dart';
import '../screens/dua1.dart';
import '../screens/namaz/namaz_screen.dart';
import '../screens/shab_e_berat.dart';

class NavigateBtns extends StatelessWidget {
  const NavigateBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      elevation: const MaterialStatePropertyAll(4),
                      shadowColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CounterHome(),
                        ),
                      );
                    },
                    child: const Text('Go To Tasbih'),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DuaScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      elevation: const MaterialStatePropertyAll(4),
                      shadowColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text('Duain'),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NamaazScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      elevation: const MaterialStatePropertyAll(4),
                      shadowColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text('Namaaz'),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShabeBaraatScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      elevation: const MaterialStatePropertyAll(4),
                      shadowColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text('Shab E Barat'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
