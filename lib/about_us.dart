import 'package:flutter/material.dart';
import 'package:tasbih/utils/library_utils.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'About', 'US'),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Welcome to our Tasbih app!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This application is to manage Tasbih that you recite daily based or occationally. With our app, you can organize your tasbih, acess any time you want. It will keep remembering your recited count even if you close the application and use later.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Add or remove Tasbih as you need.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Keep your count saved for later use.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text(
                  'Some important dua, Adab o Sunnat, Fatiha ki tariqah and duruds also will be available very soon.'),
            ),
            SizedBox(height: 16),
            Text(
              'All the informations are taken from proved imalic books followed by Ahl eSunnat wal Jamat. In case of any concern please raise a concer or directly connect with me at email id the geiven below.',
            ),
            SizedBox(height: 10),
            Text(
              'We are continuously working on improving and adding new features to enhance your reading experience. If you have any suggestions, issues, or feedback, feel free to reach out to us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email, color: Color.fromARGB(255, 3, 36, 94)),
                SizedBox(width: 8),
                Text(
                  'sddmhossain786@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 3, 36, 94),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
