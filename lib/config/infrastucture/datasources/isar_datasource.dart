

import 'package:filmora/config/domain/datasource/local_storage_datasource.dart';
import 'package:filmora/config/domain/entities/movie.dart';

class IsarDatasource extends LocalStorageDataSource{
  @override
  Future<bool> isMovieFavourite(int movieId) {
    // TODO: implement isMovieFavourite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}