import 'package:consumindo_api_com_flutter/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dio_controller.dart';

class DioPage extends GetView<DioController> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio Page')),
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