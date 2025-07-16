import 'package:filmora/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:filmora/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavouritesView extends ConsumerStatefulWidget {
  const FavouritesView({super.key});

  @override
  FavouritesViewState createState() => FavouritesViewState();
}

class FavouritesViewState extends ConsumerState<FavouritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies = await ref
        .read(favoriteMoviesProvider.notifier)
        .loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {

      final colors = Theme.of(context).colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              size: 60,
              color: colors.primary,
            ),

            const SizedBox(height: 10),
            Text('No hay películas favoritas', style: TextStyle(color: colors.primary, fontSize: 20),),
            Text('Añade las que te gusten o quieras ver', style: TextStyle(color: Colors.black45,fontSize: 15),),
            const SizedBox(height: 20,),
            FilledButton.tonal(onPressed: (){
              context.go('/home/0');
            }, child: Text('Explorar películas'))
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(loadNextPage: loadNextPage, movies: favoriteMovies),
    );
  }
}
