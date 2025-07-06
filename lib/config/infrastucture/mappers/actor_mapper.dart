import 'package:filmora/config/domain/entities/actor.dart';
import 'package:filmora/config/infrastucture/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) =>
      Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmRLRMXynnc7D6-xfdpeaoEUeon2FaU0XtPg&s', 
        character: cast.character ?? 'unKnown',
      );
}
