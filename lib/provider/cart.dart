import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity,
          price: existingCartItem.price + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            title: title,
            id: DateTime.now().toString(),
            price: price,
            quantity: 1),
      );
    }
  }
}
