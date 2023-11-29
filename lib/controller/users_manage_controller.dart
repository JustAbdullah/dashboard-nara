import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/users.dart';
import '../widgets/desktop_widgets/users_manage_desktop/users_desktop_widget.dart';

class UsersManageController extends GetxController {
  getViewUsers() async {
    var response = await crud.postRequest(AppLinksApi.getDataUsers, {});

    return response;
  }

  getAllDataUsers() async {
    var response = await getViewUsers();
    return response;
  }

  final user = Users();

  Crud crud = Crud();

  RxBool editTheAccounts = false.obs;

  RxBool showOptions = false.obs;
  deleteUser(String idUSer) async {
    var response = await crud.postRequest(AppLinksApi.deleteTheuser, {
      'id_user': idUSer.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  editTheAccessRightTo(String idUSer) async {
    var response = await crud.postRequest(AppLinksApi.editTheAccessRightIsTo, {
      'id_user': idUSer.toString(),
    });
    if (response['status'] == "success") {
      editTheAccounts.value = false;

      showOptions.value = false;
    } else {
      editTheAccounts.value = false;

      showOptions.value = false;
    }
    editTheAccounts.value = false;

    showOptions.value = false;
    Get.offAll(UsersDeskTopstatusWidget());
    return response;
  }

  editTheAccessRightNo(String idUSer) async {
    var response = await crud.postRequest(AppLinksApi.editTheAccessRightIsNo, {
      'id_user': idUSer.toString(),
    });
    if (response['status'] == "success") {
      editTheAccounts.value = false;

      showOptions.value = false;
    } else {
      editTheAccounts.value = false;

      showOptions.value = false;
    }
    editTheAccounts.value = false;

    showOptions.value = false;
    Get.offAll(UsersDeskTopstatusWidget());
    return response;
  }
}
