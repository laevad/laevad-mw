import 'package:flutter/material.dart';
import '../widgets/edit_widget.dart';

class EditScreen extends StatelessWidget {
  static const route = '/edit-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: EditWidget(),
    );
  }
}
