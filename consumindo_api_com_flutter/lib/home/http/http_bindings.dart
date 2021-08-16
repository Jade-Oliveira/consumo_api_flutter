import 'package:consumindo_api_com_flutter/home/http/http_controller.dart';
import 'package:consumindo_api_com_flutter/home/http/repository/user_http_repository.dart';
import 'package:get/get.dart';


//roda isso antes para popular as dependências que a página precisa
class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<dynamic>(UserHttpRepository());
    Get.put(HttpController(Get.find()));
  }
}