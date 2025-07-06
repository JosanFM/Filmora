


// Este repositorio es inmutable
import 'package:filmora/config/infrastucture/datasources/actor_moviedb_datasource.dart';
import 'package:filmora/config/infrastucture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});