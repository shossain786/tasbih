// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyColors {
  Color bgColor() {
    return Colors.blue;
  }

  Color barIconsColor() {
    return Colors.blue;
  }

  Color iconsColor() {
    return Colors.white;
  }

  Color appBarIconsColor() {
    return const Color.fromARGB(255, 235, 14, 14);
  }

  Color btnTextColor() {
    return Colors.blue;
  }

  Color appDrawHeadColor() {
    return Colors.white;
  }

  Color deleteIconColor() {
    return Colors.redAccent;
  }

  Color cardIconColor() {
    return Colors.orange.shade300;
  }
}

class StyledAppBarText extends StatelessWidget {
  const StyledAppBarText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Inter-SemiBold",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color.fromARGB(255, 219, 246, 239),
      ),
    );
  }
}

TextStyle drawerTextStyle1() {
  return const TextStyle(
    color: Color.fromARGB(255, 199, 244, 251),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
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
    foregroundColor: MyColors().barIconsColor(),
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
    style: TextStyle(
      fontFamily: 'Poppins-SemiBold',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: MyColors().iconsColor(),
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
