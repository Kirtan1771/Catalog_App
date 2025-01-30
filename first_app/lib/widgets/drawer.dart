import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userImage = "https://assets.telegraphindia.com/telegraph/2024/Jun/1718863655_demon-slayer01.jpg";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                accountName: Text("Kirtan Goswami"),
                accountEmail: Text("kirtangoswami21@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                ),
            ),

          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,
            color: Colors.black,),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.black,),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings,
              color: Colors.black,),
            title: Text("Settings"),
          ),

        ],
      ),
    );
  }
}
