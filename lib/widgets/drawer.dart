import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth.dart';
import '../screens/view_screen.dart';
import '../screens/add_screen.dart';
import '../screens/update_screen.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authData = Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Mobile Inventory"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.view_module),
            title: Text("View Product"),
            onTap: () {
              Navigator.of(context).pushNamed(ViewScreen.route);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Add Product"),
            onTap: () {
              Navigator.of(context).pushNamed(AddScreen.route);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Update Product"),
            onTap: () {
              Navigator.of(context).pushNamed(UpdateScreen.route);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              authData.logout();
            },
          ),
        ],
      ),
    );
  }
}
