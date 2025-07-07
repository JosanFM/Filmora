import 'package:filmora/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = '/home-screen';

  final int pageIndex;

  const HomeScreen({super.key, 
  required this.pageIndex
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),    // <------ Categorias
    FavouritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      //Lo creo en shared
      bottomNavigationBar: CustomBottonNavigation(
        currentIndex: pageIndex,
      ),
    );
  }
}

