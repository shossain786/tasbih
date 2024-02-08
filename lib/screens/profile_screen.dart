// profile_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbih/utils/library_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

String profileName = 'Default Name';

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Profile', 'Name'),
      body: ProfileForm(
        initialName: _name,
        onUpdate: (String name) {
          setState(
            () {
              _name = profileName;
            },
          );
        },
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  final Function(String name) onUpdate;
  final String initialName;

  const ProfileForm({
    super.key,
    required this.initialName,
    required this.onUpdate,
  });

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Enter Your Name'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String updatedName = _nameController.text;
              widget.onUpdate(updatedName);
              updateProfileName(updatedName);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: btnTextStyle('Update Profile'),
          ),
        ],
      ),
    );
  }

  void updateProfileName(String newName) {
    setState(() {
      profileName = newName;
      saveProfileName(newName);
    });
  }

  void saveProfileName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("profileName", name);
  }
}

class UserProfileService {
  static const String _profileNameKey = 'profileName';

  static Future<void> saveProfileName(String profileName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileNameKey, profileName);
  }

  static Future<String?> getProfileName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_profileNameKey);
  }
}
