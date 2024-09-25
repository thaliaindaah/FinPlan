import 'package:flutter/material.dart';
import 'package:test_drive/repository/playing/now_playing_repo.dart';
import 'package:test_drive/repository/playing/now_playing_repo_imp.dart';
import 'package:test_drive/service/response/api_response.dart';

import '../../model/movie/movie.dart';

class NowPlayingViewModel extends ChangeNotifier{

  final NowPlayingRepo _repository = NowPlayingRepoImp();

  ApiResponse<Movie> apiResponse = ApiResponse.loading();

  void _setNowPlaying(ApiResponse<Movie> status){
    apiResponse = status;
    notifyListeners();
  }

  Future<void> fetchNowPlaying() async {
    _setNowPlaying(ApiResponse.loading());
    _repository
        .getNowPlayingRepo()
        .then((value) => _setNowPlaying(ApiResponse.success(value)))
        .onError((error, stackTrace) => _setNowPlaying(ApiResponse.error(error.toString())));
  }

}