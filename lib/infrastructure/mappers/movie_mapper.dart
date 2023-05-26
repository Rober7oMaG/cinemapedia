import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/tmdb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/tmdb/movie_tmdb.dart';

class MovieMapper {
  static Movie theMovieDbToEntity(MovieTheMovieDB theMovieDB) => Movie(
    adult: theMovieDB.adult,
    backdropPath: (theMovieDB.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${theMovieDB.backdropPath}'
      : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    genreIds: theMovieDB.genreIds.map((e) => e.toString()).toList(),
    id: theMovieDB.id,
    originalLanguage: theMovieDB.originalLanguage,
    originalTitle: theMovieDB.originalTitle,
    overview: theMovieDB.overview,
    popularity: theMovieDB.popularity,
    posterPath: (theMovieDB.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${theMovieDB.posterPath}'
      : 'no-poster',
    releaseDate: theMovieDB.releaseDate,
    title: theMovieDB.title,
    video: theMovieDB.video,
    voteAverage: theMovieDB.voteAverage,
    voteCount: theMovieDB.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
    adult: movie.adult,
    backdropPath: (movie.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
      : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    genreIds: movie.genres.map((e) => e.name).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: (movie.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
      : 'no-poster',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount
  );
}
