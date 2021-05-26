import 'package:flutter/material.dart';
import '../widgets/dashboard.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
        title: Text('Mobile Inventory'),
      ),
      body: DashBoard(),
    );
  }
}
