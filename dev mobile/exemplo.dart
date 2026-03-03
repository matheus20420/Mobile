import 'dart:io';

void main() {
  print("Bem-vindo ao programa, escolha uma funcionalidade para usar:");
  print("1 - Calcular a média de uma lista de números");
  print("2 - verificar se um número é par ou impar");
  print("3 - calculadora");
  print("4 - sair");
  var escolha = stdin.readLineSync();
  switch (escolha) {
    case "1":
          var valor = [];
          while (true) {
            print("Digite um valor para fazer a media:");
            var entrada  = stdin.readLineSync();
            var valorEntrada = double.tryParse(entrada ?? "");
            if (valorEntrada == null || valorEntrada == "") {
              break;
            }else{
                valor.add(valorEntrada);
            }
          }
          var media = valor.reduce((a, b) => a + b) / valor.length;
          print("A media é: $media");
      break;
    case "2":
    while (true) {
      print("Digite um número para verificar se é par ou impar:");
      var entrada  = stdin.readLineSync();
      var valorEntrada = int.tryParse(entrada ?? "");
      if (valorEntrada == null || valorEntrada == "") {
        break;
      }else{
          if (valorEntrada % 2 == 0) {
            print("O número $valorEntrada é par");
          } else {
            print("O número $valorEntrada é impar");
          }
      }
    }
      break;
  }
}






