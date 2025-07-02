import 'package:dio/dio.dart';
import 'package:filmora/config/constants/environment.dart';
import 'package:filmora/config/domain/datasource/movies_datasource.dart';
import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/config/infrastucture/mappers/movie_mapper.dart';
import 'package:filmora/config/infrastucture/models/moviedb/moviedb_response.dart';




class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES'
    }
  ));


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList(); 

    
    return movies;
  }



}