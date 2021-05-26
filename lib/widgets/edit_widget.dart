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
  final _form = GlobalKey<FormState>();
  final _priceFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      print(productId);
      if (productId.isNotEmpty) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValue = {
          'name': _editedProduct.name,
          'price': _editedProduct.price.toStringAsFixed(2),
          'quantity': _editedProduct.quantity.toString(),
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    // final isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      _editedProduct = Product(
        id: _editedProduct.id,
        name: _editedProduct.name,
        price: _editedProduct.price,
        quantity: _editedProduct.quantity,
      );
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct, context);
      } catch (error) {
        await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("An error occured!"),
                  content: Text("Something went wrong!!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Okay"),
                    ),
                  ],
                ));
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _quantityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _form,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            name: value.toString(),
                            price: _editedProduct.price,
                            quantity: _editedProduct.quantity,
                          );
                        },
                        // onFieldSubmitted: (_) {
                        //   FocusScope.of(context).requestFocus(_priceFocusNode);
                        // },
                        initialValue: _initValue['name'],
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          hintText: "e.g. Coke",
                          labelText: 'Product Name',
                          labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                          hintStyle:
                              TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            name: _editedProduct.name,
                            price: double.parse(value.toString()),
                            quantity: _editedProduct.quantity,
                          );
                        },
                        focusNode: _priceFocusNode,
                        // onFieldSubmitted: (_) {
                        //   FocusScope.of(context)
                        //       .requestFocus(_quantityFocusNode);
                        // },
                        initialValue: _initValue['price'],
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          hintText: "e.g. 29",
                          labelText: 'Product Price',
                          labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                          hintStyle:
                              TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            name: _editedProduct.name,
                            price: _editedProduct.price,
                            quantity: int.parse(value.toString()),
                          );
                        },
                        focusNode: _quantityFocusNode,
                        initialValue: _initValue['quantity'],
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
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
                        onPressed: () {
                          _saveForm();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Edit Product',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
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
