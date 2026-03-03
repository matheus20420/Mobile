import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  
  // Função para enviar os dados
  Future<void> salvarUsuario(String nomeDigitado, String emailDigitado) async {
    // Endereço da sua API Java (Lembrando do 10.0.2.2 se for emulador Android!)
    final url = Uri.parse('http://10.0.2.2:8080/api/usuarios');

    // Preparando os dados no formato que o Java espera (JSON)
    final dadosEmJson = json.encode({
      'nome': nomeDigitado,
      'email': emailDigitado,
    });

    try {
      // Fazendo a requisição POST
      final response = await http.post(
        url,
        // Precisamos avisar o Java que estamos mandando um JSON
        headers: {'Content-Type': 'application/json'}, 
        body: dadosEmJson,
      );

      // Verificando a resposta do Java
      if (response.statusCode == 201) {
        print("Sucesso! O Java respondeu: ${response.body}");
      } else {
        print("Ops, algo deu errado. Código de erro: ${response.statusCode}");
      }
      
    } catch (erro) {
      print("Erro de conexão: $erro");
    }
  }
}