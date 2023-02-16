import 'package:flutter/material.dart';
import 'package:food_app_3/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Productprovider with ChangeNotifier {
  late Productmodel productmodel;

  List<Productmodel> search = [];

  productmodels(QueryDocumentSnapshot element) {
    productmodel = Productmodel(
        productImage: element.get('productImage'),
        productName: element.get('productName'),
        productPrice: element.get('productPrice'));
    search.add(productmodel);
  }

  /////////// Herbs Products //////////////////
  List<Productmodel> herbsproductlist = [];

  fetchHerbsProduct() async {
    List<Productmodel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    for (var element in value.docs) {
      productmodels(element);
      newList.add(productmodel);
    }
    // value.docs.forEach((element) {
    //   productmodel = Productmodel(
    //       productImage: element.get('productImage'),
    //       productName: element.get('productName'),
    //       productPrice: element.get('productPrice'));
    //   newList.add(productmodel);
    // });
    herbsproductlist = newList;
    notifyListeners();
  }

  List<Productmodel> get getHerbsProductDataList {
    return herbsproductlist;
  }

  /////////// FreshFruit Products //////////////////
  List<Productmodel> freshFruitdata = [];

  fetchfreshFruitData() async {
    List<Productmodel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('freshFruit').get();
    value.docs.forEach((element) {
      productmodels(element);
      newList.add(productmodel);
    });
    freshFruitdata = newList;
    notifyListeners();
  }

  List<Productmodel> get getfreshFruitDataList {
    return freshFruitdata;
  }

  List<Productmodel> get getsearchAllproduct {
    return search;
  }
}
