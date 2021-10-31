import 'package:ecommerce/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class CartProductModel {
  String name, image,productid,  price;
  int quantity;

  CartProductModel(
      {this.name,
        this.image,
        this.quantity,
        this.productid,
        this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map[quantity];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productid,
    };
  }
}
