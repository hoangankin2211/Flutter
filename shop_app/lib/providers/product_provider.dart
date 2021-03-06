// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  final List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List<Product> get item {
    return [..._item];
  }

  List<Product> get favoriteItem {
    return _item.where((element) => element.isFavorite == true).toList();
  }

  Product findById(String id) {
    return _item.firstWhere((element) => element.id == id);
  }

  Future<void> addProduct(Product value) async {
    const String url =
        'https://shop-app-database-23004-default-rtdb.asia-southeast1.firebasedatabase.app/poduct';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({'title': value.title}));

      int index = _item.indexWhere((element) => element.id == value.id);
      if (index != -1) {
        _item.removeAt(index);
        _item.insert(
          index,
          Product(
            id: json.decode(response.body).toString(),
            description: value.description,
            imageUrl: value.imageUrl,
            price: value.price,
            title: value.title,
            isFavorite: value.isFavorite,
          ),
        );
      } else {
        _item.add(
          Product(
            id: json.decode(response.body).toString(),
            description: value.description,
            imageUrl: value.imageUrl,
            price: value.price,
            title: value.title,
            isFavorite: value.isFavorite,
          ),
        );
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void deleteProduct(String id) {
    _item.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
