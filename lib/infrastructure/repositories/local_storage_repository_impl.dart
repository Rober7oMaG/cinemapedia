import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';


class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }

  @override
  Future<bool> isFavoriteMovie(int movieId) {
    return datasource.isFavoriteMovie(movieId);
  }

  @override
  Future<List<Movie>> getFavoriteMovies({ int limit = 10, int offset = 0 }) {
    return datasource.getFavoriteMovies(limit: limit, offset: offset);
  }
}