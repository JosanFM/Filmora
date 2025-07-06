

import 'package:filmora/config/domain/datasource/actors_datasouce.dart';
import 'package:filmora/config/domain/entities/actor.dart';
import 'package:filmora/config/domain/repository/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository{


  final ActorsDatasouce datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}