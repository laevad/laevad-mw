import 'package:flutter/material.dart';
import '../widgets/add_widget.dart';

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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 31,
            ),
            onPressed: () {},
          ),
        ],
        title: Text('Add Product'),
      ),
      body: AddWidget(),
    );
  }
}
