
import 'dart:convert';

import 'package:consumindo_api_com_flutter/model/user_model.dart';
import 'package:consumindo_api_com_flutter/repository/i_user_repository.dart';
import 'package:http/http.dart' as http;


//responsável pelo acesso ao serviço
class UserHttpRepository implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    final response = await http.get(Uri.parse('https://5f7cba02834b5c0016b058aa.mockapi.io/api/users'));
    //decodifico o json para uma lista
    final List<dynamic> responseMap = json.decode(response.body);
    //transformo em uma lista de userModel, o map retornaria um iterable, mas uso o toList para transformar em lista
    return responseMap.map<UserModel>((resp) => UserModel.fromMap(resp)).toList();
  }  
}