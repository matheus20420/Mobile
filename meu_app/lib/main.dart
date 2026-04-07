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
  String texto = "O Botão ainda não foi clicado";
  String nome = "Qual seu nome?";
  int contador = 0;
  final TextEditingController _textEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(nome),

          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(35))),
              labelText: "Digite seu nome",
            ),
          ),

          ElevatedButton(
            child: Text("Definir Nome"),
            onPressed: () {
              setState(() {
                if (_textEditingController.text.isEmpty) {
                  nome = "Olá, Indigente!";
                }else {
                  nome = "Olá, ${_textEditingController.text}!";
                }
              });
            },
          ),





          SizedBox(height: 35),






          Text(texto),

          ElevatedButton(
            child: 
            Text("Botão"),
            onPressed: () {
              setState(() {
                ++contador;
                if (contador > 1) {
                  texto = "O botão foi clicado $contador vezes";
                } else {
                  texto = "O botão foi clicado $contador vez";
                }
              });
            },
          ),


          SizedBox(height: 35),

          ElevatedButton(
            child: Text("Resetar"),
            onPressed: () {
              setState(() {
                contador = 0;
                texto = "O Botão ainda não foi clicado";
                nome = "Qual seu nome?";
                _textEditingController.clear();
              });
            },
          )
        ],
      ),
    );
  }
}
