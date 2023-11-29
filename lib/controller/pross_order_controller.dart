import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/orders.dart';
import '../models/products.dart';
import '../models/pross_orders.dart';

class ProssOrdersManageController extends GetxController {
  RxInt OneDay = 0.obs;
  RxInt TwoDay = 0.obs;
  RxInt ThreeDay = 0.obs;
  RxInt FourDay = 0.obs;
  RxInt FiveDay = 0.obs;
  RxInt SixDay = 0.obs;
  RxInt SevenDay = 0.obs;
  RxString dateAboutOrder = "".obs;

  getViewOrdersPross() async {
    var response = await crud.postRequest(AppLinksApi.getOrderPross, {});

    return response;
  }

  getAllDataOrdersPross() async {
    var response = await getViewOrdersPross();
    return response;
  }

  final prossorders = prossOrders();

  Crud crud = Crud();
  RxBool showTheoptions = false.obs;
  RxBool aboutTheOrder = false.obs;

  deleteOrder(String id_process) async {
    var response = await crud.postRequest(AppLinksApi.deleteOrderPross, {
      'id_process': id_process.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  editTheOrderProssDate(String date, String id_process) async {
    var response = await crud.postRequest(AppLinksApi.updateTheOrderpross, {
      'date_of_arrival': date.toString(),
      'id_process': id_process.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }
}
