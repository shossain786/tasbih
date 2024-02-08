import 'package:flutter/material.dart';
import 'package:tasbih/screens/profile_screen.dart';
import 'package:tasbih/utils/library_utils.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  String profileName = "Guest";

  @override
  void initState() {
    super.initState();
    _loadProfileName();
  }

  void _loadProfileName() async {
    String? storedProfileName = await UserProfileService.getProfileName();
    if (storedProfileName != null) {
      setState(() {
        profileName = storedProfileName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: MyColors().bgColor(),
            ),
            accountName: StyledAppBarText(profileName),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/madina_pic.png'),
            ),
            otherAccountsPictures: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit),
                ),
              ),
            ],
            accountEmail: null,
          ),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Tasbih'),
            leading: Icon(
              Icons.countertops_rounded,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/counter');
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Masnoon Duain'),
            leading: Icon(
              Icons.mosque,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Fatiiha ki Tariqah'),
            leading: Icon(
              Icons.read_more,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('About US'),
            leading: Icon(
              Icons.more,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/aboutus');
            },
          ),
        ],
      ),
    );
  }
}
