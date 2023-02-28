import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServie{
  Future<String> Uploadimage2(List<String>path) async{
   var formData= FormData.fromMap({
   });
var response = Dio().post('/',data: formData,
 options: Options(headers:{'accept': 'application/json',
            'Authorization': ''
    } ));
    print('\n\n');
    print('RESPONSE WITH DIO');
    print(response);
    print('\n\n');

    return throw("failed");

  }
  
}