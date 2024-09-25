import 'package:flutter/material.dart';
import 'package:test_drive/repository/upcoming/upcoming_repo.dart';
import 'package:test_drive/repository/upcoming/upcoming_repo_imp.dart';
import 'package:test_drive/service/response/api_response.dart';

import '../../model/movie/movie.dart';

class UpcomingViewModel extends ChangeNotifier{

  final UpcomingRepo _repository = UpcomingRepoImp();

  ApiResponse<Movie> apiResponse = ApiResponse.loading();

  void _setUpcomingMovie(ApiResponse<Movie> status){
    apiResponse = status;
    notifyListeners();
  }

  Future<void> fetchUpcomingMovie() async {
    _setUpcomingMovie(ApiResponse.loading());
    _repository
        .getUpcoming()
        .then((value) => _setUpcomingMovie(ApiResponse.success(value)))
        .onError((error, stackTrace) => _setUpcomingMovie(ApiResponse.error(error.toString())));
  }

}