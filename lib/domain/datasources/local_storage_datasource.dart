import 'package:cinemapedia/domain/entities/entities.dart';


abstract class LocalStorageDataSource {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isFavoriteMovie(int movieId);

  Future<List<Movie>> getFavoriteMovies({ int limit = 10, int offset = 0 });
}