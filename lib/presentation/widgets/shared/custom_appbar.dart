import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

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
                  onPressed: () {}, 
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