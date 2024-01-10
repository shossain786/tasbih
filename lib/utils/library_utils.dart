// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  Color bgColor() {
    return const Color.fromARGB(255, 112, 94, 192);
  }

  Color iconsColor() {
    return const Color.fromARGB(255, 199, 244, 251);
  }

  Color appBarIconsColor() {
    return const Color.fromARGB(255, 219, 246, 239);
  }
}

class StyledAppBarText extends StatelessWidget {
  const StyledAppBarText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.unbounded(
        fontSize: 20,
        color: const Color.fromARGB(255, 219, 246, 239),
      ),
    );
  }
}

TextStyle drawerTextStyle() {
  return GoogleFonts.unbounded(
    color: const Color.fromARGB(255, 199, 244, 251),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
}
