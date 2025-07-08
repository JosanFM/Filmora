import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/config/domain/repository/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {

  final LocalStorageRepository datasource;

  LocalStorageRepositoryImpl(this.datasource);



  @override
  Future<bool> isMovieFavourite(int movieId) {
    return datasource.isMovieFavourite(movieId);
  }



  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }



  @override
  Future<void> toggleFavorite(Movie movie) async {
    return datasource.toggleFavorite(movie);
  }
  
  
}