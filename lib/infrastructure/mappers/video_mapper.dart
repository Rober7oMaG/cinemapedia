import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';


class VideoMapper {
  static tmdbVideoToEntity(Result tmdbVideo) => Video(
    id: tmdbVideo.id, 
    name: tmdbVideo.name, 
    youtubeKey: tmdbVideo.key,
    publishedAt: tmdbVideo.publishedAt
  );
}