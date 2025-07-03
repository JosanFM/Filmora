import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {

    final messages = <String>[
      'Preparando el maratón de peliculas...🎬',
      'Derritiendo queso para los nachos...🧀',
      'Echando la cervecita...🍻',
      'Enviando a mi acompañante por palomitas...🍿',
      'Negociando con el Wi-Fi...📶',
      'Tardando más de lo esperado 🙄',
    ];
    return Stream.periodic(const Duration(milliseconds: 1600), (step){
      return messages [step];
    }).take(messages.length);

  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 3),
          SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot){
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            }),
        ],
      ),
    );
  }
}
