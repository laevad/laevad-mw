import 'package:flutter/material.dart';
import '../widgets/add_widget.dart';
import 'view_screen.dart';
import 'update_screen.dart';

class AddScreen extends StatelessWidget {
  static const route = '/add-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(ViewScreen.route);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 31,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(UpdateScreen.route);
            },
          ),
        ],
        title: Text('Add Product'),
      ),
      body: AddWidget(),
    );
  }
}
