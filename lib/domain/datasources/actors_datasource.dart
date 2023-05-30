import 'package:cinemapedia/domain/entities/entities.dart';


abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}