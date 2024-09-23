import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_drive/service/exception/api_exception.dart';
import 'package:test_drive/service/exception/base_exception.dart';
import 'package:test_drive/service/remote/api_end_points.dart';
import 'package:test_drive/service/remote/base_api_service.dart';

class NetworkApiService extends BaseApiService{

  late Response response;
  var dio = Dio();
  dynamic respJson;

  @override
  Future getMethod(String url) async {
    try{
      response = await dio.get(ApiEndPoints().baseUrl + url);
      respJson = ApiException().returnException(response);
      return respJson;
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
  }

  @override
  Future getMethodWithQuery(String url, Map<String, dynamic> query) async {
    try{
      response = await dio.get(ApiEndPoints().baseUrl + url, queryParameters: query);
      respJson = ApiException().returnException(response);
      return respJson;
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
  }

  @override
  Future postMethod(String url, Map<String, dynamic> body) async {
    try{
      response = await dio.post(ApiEndPoints().baseUrl + url, data: body);
      respJson = ApiException().returnException(response);
      return respJson;
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
  }

}