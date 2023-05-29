import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({ super.key });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: slideshowMovies),
            
                  MoviesHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'On Theaters',
                    subtitle: 'Playing Now',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                  ),
            
                  MoviesHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Coming Soon',
                    subtitle: 'This Month',
                    loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage()
                  ),
            
                  MoviesHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Top Rated',
                    subtitle: 'All Time',
                    loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                  ),

                  const SizedBox(height: 20)
                ],
              );
            },
            childCount: 1
          )
        )
      ],
    );
  }
}