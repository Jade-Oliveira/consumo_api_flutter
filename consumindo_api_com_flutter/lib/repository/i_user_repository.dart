import 'package:consumindo_api_com_flutter/model/user_model.dart';

abstract class IUserRepository {
  //usermodel é o modelo que vai ser a representação do json
  Future<List<UserModel>> findAllUsers();
}