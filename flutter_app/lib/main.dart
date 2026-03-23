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
        body: Column(
          children: [
            Text("Hello World"),
            Text("23/03/2026"),

          ],
        ),
      ),
    )
  );
}