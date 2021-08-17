import 'package:consumindo_api_com_flutter/home/dio/repository/user_repository_dio.dart';
import 'package:consumindo_api_com_flutter/repository/i_user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'dio_controller.dart';

class DioBindings implements Bindings {
  @override
  void dependencies() {
    //uso lazy para instanciar o Dio só a primeira vez que precisar
    Get.put(Dio());
    //get.find pega o dio acima e joga para dentro do repository
    Get.put<IUserRepository>(UserRepositoryDio(Get.find()));
    Get.put(DioController(Get.find()));
  }
}