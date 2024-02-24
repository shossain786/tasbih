import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:tasbih/utils/library_utils.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Coming', 'Soon'),
      body: SingleChildScrollView(
        child: Container(
          width: 500.0,
          height: 500.0,
          color: Colors.orange,
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Column(
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
                    'Coming Soon!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Container(
                color: Colors.orange,
                child: Container(
                  width: 207,
                  height: 207,
                  decoration: BoxDecoration(
                    color: const Color(0xffe96831),
                    borderRadius: BorderRadius.circular(47),
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
                        blurRadius: 13,
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
                    FlutterIslamicIcons.mosque,
                    size: 69,
                    color: Colors.amber,
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
