import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;


class ApiService{
  String baseUrl = 'https://fg-api.lumoshive.net/pub/api/v1/';

  Future<dynamic> apiJSONGet(String url) async {
    dynamic data;
    try{
      Map<String, String> headers = {
        'content-Type': 'application/json',
      };
      log('headers = $headers');
      log('url = $baseUrl$url');

      http.Response r = await http.get(Uri.parse(baseUrl + url), headers: headers);
      log("status codenya ${r.statusCode}");
      log(r.body.toString());
      data = json.decode(r.body);
      // log(data.toString());
      // logApi(url: url, res: r, method: "GET");
    }on SocketException{
      data = "Tidak ada koneksi internet";
    }catch(e){
      data = "terjadi kesalahan";
    }

    return data;
  }

  Future<dynamic> apiJSONPost(String url, Map<String, dynamic> params) async {
    dynamic data;

    try{
      Map<String, String> headers = {
        'content-Type': 'application/json',
      };
      log('headers = $headers');
      log('url = $baseUrl$url');

      var r = await http.post(Uri.parse(baseUrl + url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params),
          encoding: Encoding.getByName("utf-8"));
      data = jsonDecode(r.body);
      log("status codenya ${r.statusCode}");
      // log(data.toString());
      // logApi(url: url, res: r, method: "POST", payload: params);
    }on SocketException{
      data = "Tidak ada koneksi internet";
    }catch(e){
      data = "terjadi kesalahan";
    }

    return data;
  }
}
