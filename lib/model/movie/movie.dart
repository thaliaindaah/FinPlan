import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<Result>? results;
  @JsonKey(name: "total_results")
  int? totalResults;
  @JsonKey(name: "total_pages")
  int? totalPages;

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

}

@JsonSerializable()
class Result {
  Result({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "release_date")
  DateTime? releaseDate;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "original_title")
  String? originalTitle;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(name: "video")
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}
