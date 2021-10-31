import 'package:ecommerce/core/service/database/cart_database_helper.dart';
import 'package:ecommerce/model/cartproductmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();

    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productid == cartProductModel.productid) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice += (double.parse(cartProductModel.price) *
        cartProductModel.quantity);
    update();
  }

  getTotalPrice() {
    for (int i; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      update();
    }
  }

  increaseQuantity(int index)async{
    _cartProductModel[index].quantity++;
    _totalPrice += double.parse(_cartProductModel[index].price) ;
    await dbHelper.updataProduct(_cartProductModel[index]);
    update();
  }
  decreaseQuantity(int index)async{
    _cartProductModel[index].quantity--;
    _totalPrice -= double.parse(_cartProductModel[index].price) ;
   await dbHelper.updataProduct(_cartProductModel[index]);

    update();
  }


}
