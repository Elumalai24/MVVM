import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/product_view_model.dart';


class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        Provider.of<ProductViewModel>(context, listen: false).fetchProducts());
  }
  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<ProductViewModel>(
          builder: (context, value, child) {
final products = value.products;
            return FutureBuilder(
                future: Future.value(products),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting || products.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snap.hasError) {
                    return const Center(
                      child: Text("Failed to Load Products"),
                    );
                  }
                  else{

                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ListTile(
                          title: Text(product.title),
                          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                          leading: Image.network(product.image),
                        );
                      },
                    );
                  }

                });
          }
        ));
  }
}
