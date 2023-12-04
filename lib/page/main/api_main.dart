import 'package:fluttertest/api/api_service.dart';

class ApiMain{

  Future<dynamic> recentRequest()async{
    var r = await ApiService().apiJSONGet('event/recent');
    return r;
  }

}