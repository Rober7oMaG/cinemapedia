import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {

  
  @override
  void initState() {
    super.initState();
    
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);
    
    return Scaffold(
      body: MovieMasonry(
        loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
        movies: popularMovies
      )
    );
  }
}