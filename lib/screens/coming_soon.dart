import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:tasbih/utils/library_utils.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Coming', 'Soon'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orange,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Card(
                elevation: 10,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffe96831)),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    '(إن شاء الله)\nCOOMING  SOON!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 2,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(15.0, 15.0),
                          blurRadius: 30.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 8.0,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  child: Container(
                    width: double.infinity,
                    height: 307,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(65),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffcb4a13),
                          Color(0xffff864f),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffff864f),
                          offset: Offset(-20.0, -20.0),
                          blurRadius: 23,
                          spreadRadius: 0.0,
                        ),
                        BoxShadow(
                          color: Color(0xffcb4a13),
                          offset: Offset(20.0, 20.0),
                          blurRadius: 13,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      FlutterIslamicIcons.islam,
                      size: 100,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 30.0,
                          offset: Offset(15.0, 15.0),
                          color: Colors.black,
                        ),
                        Shadow(
                          blurRadius: 10.0,
                          offset: Offset(5.0, 5.0),
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
