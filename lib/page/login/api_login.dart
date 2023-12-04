import 'package:fluttertest/api/api_service.dart';

class ApiLogin{
  
  Future<dynamic> login ({required String email, required String password}) async {
    final body = {
      'email' : email,
      'password' : password
    };
    var r = await ApiService().apiJSONPost('login', body);
    return r;
  }
  
}