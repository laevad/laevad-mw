import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  // ignore: unused_element
  Future<void> fetchProduct() async {
    try {
      Map<String, String> _headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };
      final List<Product> tempList = [];
      final response = await http.get(
          Uri.parse('http://192.168.10.3/api/products'),
          headers: _headers);
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
}
