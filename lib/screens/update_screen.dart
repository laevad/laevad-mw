import 'package:flutter/material.dart';
import '../widgets/update_widdget.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class UpdateScreen extends StatefulWidget {
  static const route = '/update-screen';

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.control_point,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              size: 31,
            ),
            onPressed: () {},
          ),
        ],
        title: Text('Update Product'),
      ),
      body: FutureBuilder(
        future: Provider.of<Products>(context, listen: false).fetchProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return Center(
                child: Text("An Error occured!!"),
              );
            } else {
              return UpdateWidget();
            }
          }
        },
      ),
    );
  }
}
