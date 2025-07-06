

import 'package:dio/dio.dart';
import 'package:filmora/config/constants/environment.dart';
import 'package:filmora/config/domain/datasource/actors_datasouce.dart';
import 'package:filmora/config/domain/entities/actor.dart';
import 'package:filmora/config/infrastucture/mappers/actor_mapper.dart';
import 'package:filmora/config/infrastucture/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasouce{

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-ES',
      },
    ),
  );




  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }



}