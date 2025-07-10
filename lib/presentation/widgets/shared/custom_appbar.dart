import 'package:filmora/config/domain/entities/movie.dart';
import 'package:filmora/presentation/delegates/search_movie_delegate.dart';
import 'package:filmora/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Filmora', style: titleStyle),

                const Spacer(), // crea un expacio pero todo el posible para separarlo lo máximo que pueda

                IconButton(
                  onPressed: () {
                    //TODO:
                    final searchedMovies = ref.read(searchedMoviesProvider);
                    final searchQuery = ref.read(searchQueryProvider);
                    
                    //!Opcion previa para que no me de problemas el darle al boton de buscar la primera vez que entro a la app
                    // if (searchedMovies.isEmpty) {
                      // Opcional: puedes cargar algo por defecto o mostrar un loader
                    //   ref
                    //       .read(searchedMoviesProvider.notifier)
                   //        .searchMoviesByQuery('');
                    //   return;
                    // }

                    showSearch<Movie?>(
                      query: searchQuery,
                      context: context,
                      delegate: SearchMovieDelegate(
                        initialMovies: searchedMovies,
                        searchMovies: ref
                            .read(searchedMoviesProvider.notifier)
                            .searchMoviesByQuery,
                      ),
                    ).then((movie) {
                      if (movie == null) return;

                      // ignore: use_build_context_synchronously
                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
