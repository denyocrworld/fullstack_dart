import 'package:flutter/material.dart';
import 'package:client/core.dart';

class ProductFormView extends StatefulWidget {
  const ProductFormView({Key? key}) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      controller.item = ModalRoute.of(context)?.settings.arguments as Map;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              constraints: const BoxConstraints(
                maxWidth: 500.0,
              ),
              child: Column(
                children: [
                  QTextField(
                    label: "Product name",
                    validator: Validator.required,
                    value: controller.item?["product_name"],
                    onChanged: (value) {
                      controller.productName = value;
                    },
                  ),
                  QNumberField(
                    label: "Price",
                    validator: Validator.required,
                    value: controller.item?["price"].toString(),
                    onChanged: (value) {
                      controller.price = double.tryParse(value) ?? 0;
                    },
                  ),
                  QMemoField(
                    label: "Description",
                    validator: Validator.required,
                    value: controller.item?["description"],
                    onChanged: (value) {
                      controller.description = value;
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => controller.doSave(),
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
