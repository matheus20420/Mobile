import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Javalin',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const TelaTesteJavalin(),
    );
  }
}

class TelaTesteJavalin extends StatefulWidget {
  const TelaTesteJavalin({super.key});

  @override
  State<TelaTesteJavalin> createState() => _TelaTesteJavalinState();
}

class _TelaTesteJavalinState extends State<TelaTesteJavalin> {
  String _respostaDoServidor = "Nenhuma resposta ainda.";
  bool _carregando = false;

  // Gerencia o IP dependendo de onde o app está rodando (Emulador, Web, etc)
  String get urlBase {
    if (kIsWeb) return 'http://localhost:8080';
    if (Platform.isAndroid) return 'http://10.0.2.2:8080';
    return 'http://localhost:8080';
  }

  Future<void> enviarParaOJava() async {
    setState(() {
      _carregando = true;
      _respostaDoServidor = "Enviando dados...";
    });

    final url = Uri.parse('$urlBase/api/processar');

    // Os dados que vamos mandar para o servidor
    final dadosParaEnviar = {
      'nome': 'Desenvolvedor',
      'acao': 'Testar conexão com Javalin'
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(dadosParaEnviar),
      );

      if (response.statusCode == 200) {
        // Pega o JSON que o Java devolveu e extrai a mensagem
        final dadosRecebidos = json.decode(response.body);
        setState(() {
          _respostaDoServidor = "✅ Sucesso:\n\n${dadosRecebidos['mensagem']}";
        });
      } else {
        setState(() => _respostaDoServidor = "❌ Erro no Servidor: ${response.statusCode}");
      }
    } catch (e) {
      setState(() => _respostaDoServidor = "❌ Falha de Conexão:\nVerifique se o Java está rodando.\nErro: $e");
    } finally {
      setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Javalin')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Clique no botão para enviar os dados para o servidor Java:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _carregando ? null : enviarParaOJava,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: _carregando 
                    ? const CircularProgressIndicator(color: Colors.white) 
                    : const Text('Enviar para o Java', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                width: double.infinity,
                child: Text(
                  _respostaDoServidor,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}