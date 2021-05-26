import 'package:flutter/material.dart';
import '../widgets/dashboard.dart';
import '../provider/auth.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authData = Provider.of<Auth>(context);
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            onPressed: () {
              authData.logout();
            },
          ),
        ],
        title: Text('Mobile Inventory'),
      ),
      body: DashBoard(),
    );
  }
}
