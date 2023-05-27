import 'package:dio/dio.dart';

class ProductService {
  Future<List> getProducts() async {
    var response = await Dio().get(
      "http://localhost:8080/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  create({
    required String productName,
    required double price,
    required String description,
  }) async {
    await Dio().post(
      "http://localhost:8080/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product_name": productName,
        "price": price,
        "description": description,
      },
    );
  }

  update({
    required int id,
    required String productName,
    required double price,
    required String description,
  }) async {
    await Dio().put(
      "http://localhost:8080/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product_name": productName,
        "price": price,
        "description": description,
      },
    );
  }

  delete(int id) async {
    await Dio().delete(
      "http://localhost:8080/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }
}
