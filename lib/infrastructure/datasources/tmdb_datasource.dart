import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';
import 'package:cinemapedia/infrastructure/mappers/mappers.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';


class TheMovieDbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbApiKey,
        'language': 'en-US',
      },
    )
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final theMovieDbResponse = TheMovieDbResponse.fromJson(json);

    final List<Movie> movies = theMovieDbResponse.results
      .where(
        (theMovieDB) => theMovieDB.posterPath != 'no-poster'
      )
      .map(
        (theMovieDB) => MovieMapper.theMovieDbToEntity(theMovieDB)
      ).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie with id $id not found.');

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await dio.get('/search/movie',
      queryParameters: {
        'query': query
      }
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Video>> getMovieYoutubeVideos(int movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final tmdbVideosResponse = TheMovieDbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for (final tmdbVideo in tmdbVideosResponse.results) {
      if (tmdbVideo.site == 'YouTube') {
        final video = VideoMapper.tmdbVideoToEntity(tmdbVideo);
        videos.add(video);
      }
    }

    return videos;
  }
  
  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final response = await dio.get('/movie/$movieId/recommendations');
    if (response.statusCode != 200) throw Exception('Movie with id $movieId not found.');

    return _jsonToMovies(response.data);
  }
}