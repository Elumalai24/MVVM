// main.dart
import 'package:flutter/material.dart';
import 'package:mvvm/view/product_screen.dart';
import 'package:mvvm/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductViewModel(),
      child: MaterialApp(
        title: 'MVVM Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListView(),
      ),
    );
  }
}
