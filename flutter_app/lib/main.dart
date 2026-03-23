import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
             child: Text("Meu App"),
            )
          ),
        body: Text("teste"),
      ),
    )
  );
}