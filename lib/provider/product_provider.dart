import 'package:flutter/cupertino.dart';
import 'package:my_workshop/model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
}