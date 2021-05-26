import 'package:flutter/material.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  var _editedProduct = Product(name: '', price: 0, quantity: 0);
  var _initValue = {'name': '', 'price': '', 'quantity': ''};
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      print(productId);
      if (productId.isNotEmpty) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValue = {};
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
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
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
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
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
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
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
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
                    'Edit Product',
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
    );
  }
}
