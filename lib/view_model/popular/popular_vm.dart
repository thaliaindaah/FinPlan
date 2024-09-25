import 'package:flutter/material.dart';
import 'package:test_drive/repository/popular/popular_repo.dart';
import 'package:test_drive/repository/popular/popular_repo_imp.dart';
import 'package:test_drive/service/response/api_response.dart';

import '../../model/movie/movie.dart';

class PopularViewModel extends ChangeNotifier{
  final PopularRepo _repository = PopularRepoImp();

  ApiResponse<Movie> apiResponse = ApiResponse.loading();

  void _setPopularMovie(ApiResponse<Movie> status){
    apiResponse = status;
    notifyListeners();
  }

  Future<void> fetchPopularMovie() async {
    _setPopularMovie(ApiResponse.loading());
    _repository
        .getPopular()
        .then((value) => _setPopularMovie(ApiResponse.success(value)))
        .onError((error, stackTrace) => _setPopularMovie(ApiResponse.error(error.toString())));
  }

}