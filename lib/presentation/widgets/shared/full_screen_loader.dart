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
    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return messages [step];
    }).take(messages.length);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background2.png'),
          fit: BoxFit.cover,
          ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding:  const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Espere por favor', style: TextStyle(
                color: Colors.white
              )),
              const SizedBox(height: 10),
              const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,),
              SizedBox(height: 10),
                
              StreamBuilder(
                stream: getLoadingMessages(), 
                builder: (context, snapshot){
                  if (!snapshot.hasData) return const Text('Cargando...', style: TextStyle(color: Colors.white),);
                  return Text(snapshot.data!, style: TextStyle(color: Colors.white),);
                }),
            ],
          ),
        ),
      ),
    );
  }
}
