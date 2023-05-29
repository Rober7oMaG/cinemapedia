import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimilarMovies extends ConsumerWidget {
  final int movieId;

  const SimilarMovies({
    super.key,
    required this.movieId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recommendations(movies: movies), 
      error: (_, __) => const Center(
        child: Text('Could not load related movies'),
      ), 
      loading: () => const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      )
    );
  }
}

class _Recommendations extends StatelessWidget {
  final List<Movie> movies;

  const _Recommendations({
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return MoviesHorizontalListView(
      movies: movies,
      title: 'Related',
    );
  }
}