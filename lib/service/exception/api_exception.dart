import 'package:dio/dio.dart';

import 'base_exception.dart';

class ApiException{
  dynamic returnException(Response response){
    switch(response.statusCode){
      case 200:
        dynamic resp = response.data;
        return resp;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException('Error during communication: ${response.toString()}');
    }
  }
}