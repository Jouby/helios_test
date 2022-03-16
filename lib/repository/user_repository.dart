import 'dart:async';
import 'dart:convert';
import 'package:helios_test/model/user.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://randomuser.me/api";

class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();

  factory UserRepository() {
    return _singleton;
  }

  UserRepository._internal();

  Future<List<User>> getUsers({int page = 1}) async {
    var url = Uri.parse(baseUrl + "/?page=$page&results=20");
    var response = await http.get(url);
    var result = jsonDecode(response.body)['results'] as List<dynamic>;

    return result.map((_) => User.fromJson(_)).toList();
  }
}
