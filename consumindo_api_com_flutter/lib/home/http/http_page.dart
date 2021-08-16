import 'package:consumindo_api_com_flutter/home/http/http_controller.dart';
import 'package:consumindo_api_com_flutter/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//GetView é um statelessWidget que tem um controller fazendo um find
class HttpPage extends GetView<HttpController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http')),
      //controla todas as estruturas do stateMixin
      body: controller.obx((state) {
        return ListView.builder(
          //no nosso caso o state é sempre uma lista
          itemCount: state.length,
          itemBuilder: (context, index) {
            final UserModel item = state[index];
            return ListTile(
              title: Text(item.name!),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error!),
              TextButton(
                onPressed: () => controller..findUsers(),
                child: Text('Tentar novamente')
              )
            ]
          )
        );
      }),
    );
  }
}