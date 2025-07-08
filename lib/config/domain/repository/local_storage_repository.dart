


import 'package:filmora/config/domain/entities/movie.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavourite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
  
}
