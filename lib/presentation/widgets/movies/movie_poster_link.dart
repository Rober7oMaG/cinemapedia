import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/domain/entities/entities.dart';


class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            image: NetworkImage(movie.posterPath),
            placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}