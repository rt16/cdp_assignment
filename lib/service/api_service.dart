import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
Future<Map> getCall(String url) async {
    var status;
    var response;
    try {
      response = await http.get(Uri.parse(url),);
      status = response.statusCode;
      print (status);
    }     
     on SocketException catch (_) {
      var data = Map();
      print('Server Not Reachable');
      data['status'] = 550;
      return data;
    }
    switch (status) {
      case 200:
        Map data = {'status': 200, 'body': json.decode(response.body)};
        return data;     
      case 401:
        Map data = {'status': 401};
        return data;      
      case 404:
        Map data = {'status': 404};
        return data;    
      default:
        Map data = {'status': 406};
        return data;
    }
  }