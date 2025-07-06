import 'package:animate_do/animate_do.dart';
import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';


typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);


class SearchMovieDelegate extends SearchDelegate<Movie?>{


  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({super.searchFieldLabel, super.searchFieldStyle, super.searchFieldDecorationTheme, super.keyboardType, super.textInputAction, super.autocorrect, super.enableSuggestions, required this.searchMovies});

  @override
  String get searchFieldLabel => 'Buscar pelicula';
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      if( query.isNotEmpty )
      FadeIn(
        child: IconButton(onPressed: () => query = '',
        icon: const Icon(Icons.clear)
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
    
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      initialData: const [],
      builder: (context, snapshot) {

        final movies = snapshot.data ?? [];

        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
          
            
        );
      }
    );
  }
}



class _MovieItem extends StatelessWidget {

   final Movie movie;
  const _MovieItem({ required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical : 10),
      child: Row(
        children: [
          //Image
          SizedBox(width: size.width * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.posterPath,
              loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),  
            ),
          ),
          ),

          SizedBox(width: 10,),

          //Description
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyles.titleSmall,),
                
                (movie.overview.length > 100) ? Text('${movie.overview.substring(0,100)}...') : Text(movie.overview),

                Row(
                  children: [
                    Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
                    const SizedBox(width: 5,),
                    Text(HumanFormats.number(movie.voteAverage, 1 ), style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),)
                  ],
                )  
              ],
            ),
          ),

          //Description
        ],
      ),
    );
  }
}