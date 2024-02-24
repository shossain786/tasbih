import 'package:flutter/material.dart';
import 'package:tasbih/screens/profile_screen.dart';
import 'package:tasbih/utils/library_utils.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

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
              FlutterIslamicIcons.tasbihHand,
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
            title: drawerTextStyle('Namaaz'),
            leading: Icon(
              FlutterIslamicIcons.sajadah,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/namaz');
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Masnoon Duain'),
            leading: Icon(
              FlutterIslamicIcons.prayer,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/duain');
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Shab e Berat'),
            leading: Icon(
              FlutterIslamicIcons.crescentMoon,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/shabebarat');
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Fatiiha ki Tariqah'),
            leading: Icon(
              FlutterIslamicIcons.mosque,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/fatiha');
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          ListTile(
            tileColor: MyColors().bgColor(),
            title: drawerTextStyle('Adab O Sunnat'),
            leading: Icon(
              FlutterIslamicIcons.islam,
              color: MyColors().iconsColor(),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: MyColors().iconsColor(),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/adab');
            },
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
