import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/config/infrastucture/models/moviedb/movie_details.dart';
import 'package:filmora/config/infrastucture/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
        : 'https://thumbs.dreamstime.com/b/glitch-concept-error-page-not-found-error-glitch-neon-concept-error-page-not-found-neon-lost-network-site-social-madia-web-app-200796796.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
        : 'https://content.numetro.co.za/ui_images/no_poster.png',
    releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToENtity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
        : 'https://thumbs.dreamstime.com/b/glitch-concept-error-page-not-found-error-glitch-neon-concept-error-page-not-found-neon-lost-network-site-social-madia-web-app-200796796.jpg',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
        : 'https://thumbs.dreamstime.com/b/glitch-concept-error-page-not-found-error-glitch-neon-concept-error-page-not-found-neon-lost-network-site-social-madia-web-app-200796796.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
