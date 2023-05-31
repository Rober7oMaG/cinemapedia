import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infrastructure/datasources/tmdb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';


final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDbDataSource());
});