import 'package:flutter/material.dart'; // Não esqueça do import!

void main() {
  runApp(
    MaterialApp(
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
    ),
  );
}