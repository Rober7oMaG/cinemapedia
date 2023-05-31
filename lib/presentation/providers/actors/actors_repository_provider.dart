import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infrastructure/datasources/actor_tmdb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';


final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorTheMovieDbDataSource());
});