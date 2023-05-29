import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class IsarDataSource extends LocalStorageDataSource {
  late Future<Isar> db;

  IsarDataSource() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema], 
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    final isar = await db;

    final Movie? movie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return movie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    } 
    
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
  
  @override
  Future<List<Movie>> getFavoriteMovies({int limit = 10, int offset = 0}) async {
    final isar = await db;

    return isar.movies
      .where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }
}