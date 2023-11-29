import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/orders.dart';
import '../models/products.dart';
import '../models/shopping_cart.dart';

class OrdersManageController extends GetxController {
  getViewOrders() async {
    var response = await crud.postRequest(AppLinksApi.getorders, {});

    return response;
  }

  getAllDataOrders() async {
    var response = await getViewOrders();
    return response;
  }

  final orders = Orders();
  final products = Products();
  final shoppingCart = ShoppingCart();

  Crud crud = Crud();
  RxBool showTheoptions = false.obs;
  RxBool aboutTheOrder = false.obs;

  deleteOrder(String idOfOrder) async {
    var response = await crud.postRequest(AppLinksApi.deleteOrder, {
      'id_order': idOfOrder.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  getShoppingcart(String idOfOrder) async {
    var response = await crud.postRequest(AppLinksApi.getTheShoppingCart, {
      'id_order_shopping_cart': idOfOrder.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  getColorShoppingcart(String id_shoppingCart) async {
    var response = await crud.postRequest(AppLinksApi.getColorsProductsOrders, {
      'id_shoppingCart': id_shoppingCart.toString(),
    });

    return response;
  }

  getSizesShoppingcart(String id_shoppingCart) async {
    var response = await crud.postRequest(AppLinksApi.getSizesProductOrders, {
      'id_shoppingCart': id_shoppingCart.toString(),
    });

    return response;
  }
}
