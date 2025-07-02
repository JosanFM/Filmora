

import 'package:filmora/config/domain/datasource/movies_datasource.dart';
import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/config/domain/repository/movies_repository.dart';



class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {

    return datasource.getNowPlaying(page: page);
  }



}