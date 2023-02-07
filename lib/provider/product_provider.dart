import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;

  List<ProductModel> herbsProductList = [];

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];

    var value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    print("Herbs Product Length--- :${value.size}");
    value.docs.forEach((element) {
      print("Product data : ${element.data()}");
      productModel = ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"));
      newList.add(productModel!);
    });

    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }
}
