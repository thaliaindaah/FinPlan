import 'package:flutter/foundation.dart';
import 'package:test_drive/model/movie/movie.dart';
import 'package:test_drive/repository/playing/now_playing_repo.dart';
import 'package:test_drive/utils/constanta.dart';

import '../../service/remote/api_end_points.dart';
import '../../service/remote/base_api_service.dart';
import '../../service/remote/network_api_service.dart';

class NowPlayingRepoImp implements NowPlayingRepo{

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<Movie?> getNowPlayingRepo() async {
    try{
      dynamic response = await _apiService.getMethodWithQuery(ApiEndPoints().getPopularMovie, {
        "api_key": Constanta.apiKey,
        "language": Constanta.defaultLanguageReq,
        "page": "1",
        "region": Constanta.defaultRegion
      });
      if (kDebugMode) {
        print("Response Success Now Playing Repo Imp: $response");
      }
      final data = Movie.fromJson(response);
      return data;
    }catch(e){
      if (kDebugMode) {
        print("Response Err Now Playing Repo Imp: $e");
      }
      rethrow;
    }
  }

}