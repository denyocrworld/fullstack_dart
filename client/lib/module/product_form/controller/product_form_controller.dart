import 'package:client/core.dart';
import 'package:flutter/material.dart';

class ProductFormController extends State<ProductFormView>
    implements MvcController {
  static late ProductFormController instance;
  late ProductFormView view;
  Map? item;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? productName;
  double? price;
  String? description;

  bool get isEditMode => item != null;
  doSave() async {
    if (isEditMode) {
      await ProductService().update(
        id: item!["id"],
        productName: productName ?? item?["product_name"],
        price: price ?? item?["price"],
        description: description ?? item?["description"],
      );
    } else {
      await ProductService().create(
        productName: productName!,
        price: price!,
        description: description!,
      );
    }

    Get.back();
  }
}
