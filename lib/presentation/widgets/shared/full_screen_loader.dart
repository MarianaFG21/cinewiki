import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas.',
      'Cargando peliculas..',
      'Cargando peliculas...',
      'Cargando peliculas....',
      'Cargando peliculas.....',
      // 'Comprando palomitas de maiz',
      // 'Cargando populares',
      // 'Llamando a mi novia',
      // 'Ya casi terminamos',
      // 'Esto esta tardando mucho',
    ];
    return Stream<String>.periodic(
        const Duration(milliseconds: 200), 
        (step) => messages[step]).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
