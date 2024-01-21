import 'package:flutter/cupertino.dart';
import 'package:my_workshop/model/product.dart';
import 'package:my_workshop/service/api_service.dart';

class ProductProvider with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Product> products = [];

  Future<void> getProducts() async{
     var res = await apiService.get(path: "products");
     print(res);
  }
}