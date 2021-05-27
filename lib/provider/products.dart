import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../screens/view_screen.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  String url = "https://mwinventory.000webhostapp.com/api/products";

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchProduct() async {
    try {
      Map<String, String> _headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };
      final List<Product> tempList = [];
      final response = await http.get(Uri.parse(url), headers: _headers);
      List<dynamic> values;
      values = await json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            final Product lstProd = Product(
                id: "${map['id']}",
                name: "${map['name']}",
                price: double.parse(map['price'].toString()),
                quantity: map['quantity']);
            tempList.add(lstProd);
          }
        }
        _items = tempList;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> addProduct(Product product, BuildContext context) async {
    try {
      await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'name': product.name,
            'price': product.price,
            'quantity': product.quantity
          }));
      final newProduct = Product(
        name: product.name,
        price: product.price,
        quantity: product.quantity,
      );
      _items.add(newProduct);
      Navigator.of(context).pushReplacementNamed(ViewScreen.route);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);

    if (prodIndex >= 0) {
      await http.patch(
        Uri.parse('$url/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': newProduct.name,
          'price': newProduct.price,
          'quantity': newProduct.quantity
        }),
      );
      _items[prodIndex] = newProduct;

      notifyListeners();
    } else {
      print('prodId not found');
    }
  }

  Future<void> deleteProduct(String id) async {
    print(id.runtimeType);
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
    final response = await http.delete(
      Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException("Could not delete product");
    } else {}
    existingProduct = null;
  }
}
