
import 'dart:convert';

import 'package:consumindo_api_com_flutter/model/user_type.dart';

class UserModel {
  
  String? id;
  String? name;
  String? usernames;
  List<UserType> types;

  UserModel({
    this.id,
    this.name,
    this.usernames,
    required this.types,
  });


    //vai tranformar o modelo de dados em um mapa de chave/valor
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'usernames': usernames,
      'user_types': types.map((x) => x.toMap()).toList(),
    };
  }

  //factory - é um construtor que recebe valores e retorna uma instância do que ele precisa
  //essa função recebe o map e transforma em um UserModel  
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      usernames: map['usernames'],
      types: List<UserType>.from(map['user_types']?.map((x) => UserType.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
