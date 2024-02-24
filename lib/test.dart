import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(
    home: DataPage(),
  ));
}

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  String _jsonData = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Check if local file exists
    File file = await _getLocalFile();
    if (await file.exists()) {
      // Load data from local file
      String jsonData = await file.readAsString();
      setState(() {
        _jsonData = jsonData;
      });
    } else {
      // Fetch data from network
      fetchData();
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://drive.google.com/file/d/1sJG39ZFhw4Io2IZ0uzw2YL980RXZY4Kb/view?usp=sharing'));
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          // Store data locally
          File file = await _getLocalFile();
          await file.writeAsString(response.body);
          setState(() {
            _jsonData = response.body;
          });
        } else {
          throw Exception(
              'Response content type is not JSON. Content-Type: $contentType');
        }
      } else {
        throw Exception('Failed to fetch data from the network');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Page'),
      ),
      body: Center(
        child: _jsonData.isEmpty
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _jsonData,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: const Icon(Icons.sync),
      ),
    );
  }
}
