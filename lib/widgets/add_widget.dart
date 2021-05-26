import 'package:flutter/material.dart';
import 'package:laevad_flutter_project/models/product.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
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
    final productsData = Provider.of<Products>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
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
              TextField(
                controller: priceController,
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
              TextField(
                controller: quantityController,
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
                onPressed: () {
                  productsData.addProduct(
                      Product(
                        name: nameController.text,
                        price: double.parse(priceController.text),
                        quantity: int.parse(quantityController.text),
                      ),
                      context);
                },
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
    );
  }
}
