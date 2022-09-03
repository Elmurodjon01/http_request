import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_request/model/employee.dart';

import '../model/post.dart';

class Net {
  static String base = 'dummy.restapiexample.com';
 static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  //https APIs
  static String Api_list = '/api/v1/employees';
  static String Api_individual = '/api/v1/employee/1';
  static String Api_create = '/api/v1/create';
  //update == put
  static String Api_update = '/public/api/v1/update/21';//{id}
  static String Api_delete = '/public/api/v1/update/2';//{id}

//http requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }



  //http params
  static Map<String, String> paramsEmpty(){
    Map<String, String> params = new Map();
    return params;
  }


  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsCreate (Employee employee){
    Map<String, String> params = Map();
    params.addAll({
      'id': employee.id.toString(),
      'employee_name': employee.employee_name,
      'employee_salary': employee.employee_salary.toString(),
      'employee_age': employee.employee_age.toString(),
      'profile_image': employee.profile_image,
      'message': employee.message,
    });
    return params;
  }
  static Map<String, String> paramsUpdate (Employee employee){
    Map<String, String> params = Map();
    params.addAll({
      'id': employee.id.toString(),
      'employee_name': employee.employee_name,
      'employee_salary': employee.employee_salary.toString(),
      'employee_age': employee.employee_age.toString(),
      'profile_image': employee.profile_image,
      'message': employee.message,
    });
    return params;
  }
}

// int id;
// String employee_name;
// int employee_salary;
// int employee_age;
// String profile_image;
// String message;
