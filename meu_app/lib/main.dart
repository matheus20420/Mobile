import 'package:flutter/material.dart'; // Não esqueça do import!

void main() {
  runApp(StatelessApp());
}

class StatelessApp extends StatelessWidget {
  StatelessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(53, 53, 53, 1),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Text("Meu App"),
        ),
        body: PaginaInicial(),
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
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(texto),
          ElevatedButton(
            child: Text("Mudar Texto"),
            onPressed: () {
              setState(() {
                ++contador;
                if (contador > 1) {
                  texto = "Hello World (o botão foi clicado $contador vezes";
                } else {
                  texto = "Hello World (o botão foi clicado $contador vez";
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
