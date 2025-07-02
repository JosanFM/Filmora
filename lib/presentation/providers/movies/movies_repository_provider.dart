
import 'package:filmora/config/infrastucture/datasources/moviedb_datasource.dart';
import 'package:filmora/config/infrastucture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Este repositorio es inmutable y proporciona la información necesaria para que pueda consultar la data del repositorio
final movieRepositoryProvider =  Provider((ref){
  return MovieRepositoryImpl(MoviedbDatasource());
});