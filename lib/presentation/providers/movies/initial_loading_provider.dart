import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;  //isEMpty (esta vacio)
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4= ref.watch(upcomingMoviesProvider).isEmpty;

  if ( step1 == true || step2 == true || step3 == true || step4 == true ) return true;

  return false; // Terminamos de cargar
});