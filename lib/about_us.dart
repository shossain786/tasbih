import 'package:flutter/material.dart';
// import 'package:tasbih/utils/library_utils.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About US'),
        // centerTitle: true,
        // backgroundColor: MyColors().bgColor(),
        // foregroundColor: MyColors().appBarIconsColor(),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to our Tasbih app!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This application is to manage Tasbih that you recite daily based or occationally. With our app, you can organize your tasbih, acess any time you want. It will keep remembering your recited count even if you close the application and use later.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
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
                  'Some important dua and duruds also will be available very soon.'),
            ),
            SizedBox(height: 16),
            Text(
              'We are continuously working on improving and adding new features to enhance your reading experience. If you have any suggestions, issues, or feedback, feel free to reach out to us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, color: Color.fromARGB(255, 3, 36, 94)),
                SizedBox(width: 8),
                Text(
                  'sddmhossain786@gmail.com',
                  style: TextStyle(
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
