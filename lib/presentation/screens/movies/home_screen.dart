import 'package:filmora/presentation/providers/providers.dart';
import 'package:filmora/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      //Lo creo en shared
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    

    return FullScreenLoader();
    
    // SIngleChildScrollView ( si no queremos que el buscador de arriba se mueva con el scroll y cambiar el slivers por el child) (con el sliver todos los widgets son SliverAppbar o lo que sea)
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [

                MoviesSlidesshow(movies: slideShowMovies),

                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  //subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Pupulares',
                  subTitle: 'En los años',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'Desde Siempre',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
