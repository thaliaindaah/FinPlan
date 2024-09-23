import 'package:flutter/foundation.dart';
import 'package:test_drive/model/movie/movie.dart';
import 'package:test_drive/repository/upcoming/upcoming_repo.dart';
import 'package:test_drive/service/remote/base_api_service.dart';
import 'package:test_drive/service/remote/network_api_service.dart';

import '../../service/remote/api_end_points.dart';
import '../../utils/constanta.dart';

class UpcomingRepoImp implements UpcomingRepo{

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<Movie?> getUpcoming() async {
    try{
      dynamic response = await _apiService.getMethodWithQuery(ApiEndPoints().getUpcoming, {
        "api_key": Constanta.apiKey,
        "language": Constanta.defaultLanguageReq,
        "page": "1",
        "region": Constanta.defaultRegion
      });
      if (kDebugMode) {
        print("Response Success Upcoming Repo Imp: $response");
      }
      final data = Movie.fromJson(response);
      return data;
    }catch(e){
      if (kDebugMode) {
        print("Response Err Upcoming Repo Imp: $e");
      }
      rethrow;
    }
  }

}