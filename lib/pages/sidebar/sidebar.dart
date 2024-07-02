import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test/pages/sidebar/Profile.dart';
import 'package:my_test/pages/sidebar/loginfetch.dart';
import 'package:my_test/pages/sidebar/normal_api.dart';
import 'package:my_test/pages/sidebar/provider.dart';

import 'package:my_test/pages/sidebar/setting.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  final List menulst = const [
    {
      "leading": Icon(Icons.account_circle, color: Colors.blue),
      "title": "Profile",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 1
    },
    {
      "leading": Icon(
        Icons.api_outlined,
        color: Colors.blue,
      ),
      "title": "Normal API Call",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2
    },
    {
      "leading": Icon(
        Icons.api_rounded,
        color: Colors.blue,
      ),
      "title": "Provider With API Call",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3
    },
    {
      "leading": Icon(
        Icons.login_outlined,
        color: Colors.blue,
      ),
      "title": "Login Data Fetch",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Colors.blue,
      ),
      "title": "Setting",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 290,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("image/p.png"),
                    radius: 30,
                  ),
                  title: Text(
                    "Paresh Hadiya",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "7435800076",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                ...menulst.map((sidemenudata) {
                  return ListTile(
                    leading: sidemenudata['leading'],
                    title: Text(sidemenudata['title']),
                    trailing: sidemenudata['trailing'],
                    onTap: () {
                      Navigator.pop(context);

                      if (sidemenudata["action_id"] == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      } else if (sidemenudata["action_id"] == 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NormalPage()));
                      } else if (sidemenudata["action_id"] == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProviderPage()));
                      } else if (sidemenudata["action_id"] == 4) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginfetchPage()));
                      } else if (sidemenudata["action_id"] == 5) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingPage()));
                      }
                    },
                  );
                }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
