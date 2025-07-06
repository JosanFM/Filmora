import 'package:filmora/presentation/delegates/search_movie_delegate.dart';
import 'package:filmora/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color:colors.primary),
                const SizedBox(width: 5),
                Text('Filmora', style: titleStyle),
            
                const Spacer(),  // crea un expacio pero todo el posible para separarlo lo máximo que pueda
            
                IconButton(
                  onPressed: () {

                    final movieRepository = ref.read(movieRepositoryProvider);

                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate(searchMovies: movieRepository.searchMovies)
                    );

                  }, 
                  icon: Icon(Icons.search)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}