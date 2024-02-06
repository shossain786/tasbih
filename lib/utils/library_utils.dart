// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  Color bgColor() {
    return Colors.blue;
  }

  Color iconsColor() {
    return Colors.blue;
  }

  Color appBarIconsColor() {
    return const Color.fromARGB(255, 235, 14, 14);
  }

  Color btnTextColor() {
    return Colors.blue;
  }
}

AppBar myCustomAppBar(BuildContext context, String title, String title2) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title2,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    foregroundColor: MyColors().iconsColor(),
  );
}

AppBar myAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: 'Inter-SemiBold',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    backgroundColor: MyColors().bgColor(),
    foregroundColor: MyColors().appBarIconsColor(),
    centerTitle: true,
  );
}

Text drawerTextStyle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontFamily: 'Poppins-SemiBold',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.red,
    ),
  );
}

Text btnTextStyle(String text) {
  String title = text;
  return Text(
    title,
    style: TextStyle(
      fontFamily: 'Poppins-SemiBold',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: MyColors().btnTextColor(),
    ),
  );
}
