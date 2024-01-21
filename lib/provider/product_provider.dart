import 'package:flutter/cupertino.dart';
import 'package:my_workshop/model/product.dart';
import 'package:my_workshop/service/api_service.dart';

class ProductProvider with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Product> products = [];
  Product? productSelected;

  Future<void> getProducts() async {
    var res = await apiService.get(path: "products");
    if (res != null) {
      products = List.from(
        res.map(
          (i) => Product.fromJson(i),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> updateProducts({
    required int id,
    required String name,
    required String imageUrl,
    required String description,
    required String price,
  }) async {
    var body = {
      "name": name,
      "image_url": imageUrl,
      "description": description,
      "price": price,
    };
    var res = await apiService.put(path: "product/$id", body: body);
    if (res != null) {
      await getProducts();
      notifyListeners();
    }
  }

  Future<void> addProducts({
    required String name,
    required String imageUrl,
    required String description,
    required String price,
  }) async {
    var body = {
      "name": name,
      "image_url": imageUrl,
      "description": description,
      "price": price,
    };
    var res = await apiService.post(path: "product", body: body);
    if (res != null) {
      await getProducts();
      notifyListeners();
    }
  }

  setProductSelected(Product product) {
    productSelected = product;
  }
}
