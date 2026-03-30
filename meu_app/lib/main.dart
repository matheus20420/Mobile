import 'package:flutter/material.dart'; // Não esqueça do import!

void main() {
  runApp(
    StatelessApp(),
  );
}



class StatelessApp extends StatelessWidget {
  StatelessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
            child: Text("Meu App"),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Hello World"),
              SizedBox(width: 10), // Espaço entre os textos
              Icon(Icons.add)
            ],
          ),
        ),
      ),
    );
  }
}


class PaginaInicial extends StatefulWidget {
  @override
  State<PaginaInicial> createState() => _PaginaInicialState();

}

class _PaginaInicialState extends State<PaginaInicial> {
  String texto = "Hello World";


  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          Text(texto),
          ElevatedButton(
            child: Text("Mudar Texto"),
            onPressed: () {
              texto = "Olá Mundo (Traduzido)";
            }
          ),
        ],
      )
    );
  }
}