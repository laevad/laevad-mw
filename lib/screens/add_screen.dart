import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  static const route = '/add-screen';
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    hintText: "e.g. Coke",
                    labelText: 'Product Name',
                    labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    hintText: "e.g. 29",
                    labelText: 'Product Price',
                    labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    hintText: "e.g 150",
                    labelText: 'Product Quantity',
                    labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.7),
                          Theme.of(context).primaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
