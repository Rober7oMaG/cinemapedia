import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/entities/tmdb_response.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final theMovieDbResponse = TheMovieDbResponse.fromJson(response.data);

    final List<Movie> movies = theMovieDbResponse.results
      .where(
        (theMovieDB) => theMovieDB.posterPath != 'no-poster'
      )
      .map(
        (theMovieDB) => MovieMapper.theMovieDbToEntity(theMovieDB)
      ).toList();

    return movies;
  }
}