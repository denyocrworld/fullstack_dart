import 'package:flutter/material.dart';
import 'package:client/core.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductList"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => controller.doCreate(),
                child: const Text("Create"),
              ),
              ProductTable(
                items: controller.products,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
