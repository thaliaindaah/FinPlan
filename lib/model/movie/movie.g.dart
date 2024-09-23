// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int?,
      totalPages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      originalLanguage: json['original_language'] as String?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate?.toIso8601String(),
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };
