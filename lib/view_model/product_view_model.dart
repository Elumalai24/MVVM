import 'package:flutter/material.dart';
import '../model/product.dart';
import '../repository/product_api.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  ApiService api = ApiService();
  Future<void> fetchProducts() async {
    _products = await api.getProducts();
    print(_products);
    notifyListeners();
  }
}
