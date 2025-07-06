

import 'package:filmora/config/domain/entities/actor.dart';

abstract class ActorsDatasouce {

  Future<List<Actor>> getActorsByMovie(String movieId);
  
}