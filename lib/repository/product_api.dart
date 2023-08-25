import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getProducts() async {
    try {
      final request =
          http.Request("GET", Uri.parse("https://fakestoreapi.com/products"));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        final List<dynamic> decoded = jsonDecode(jsonData);
        List<Product> products =
            decoded.map((e) => Product.fromJson(e)).toList();
        return products;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }
}
