import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(AppServoMotor());
}

class AppServoMotor extends StatelessWidget {
  final String serverIp = "10.0.3.118"; // IP do Arduino

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Servo Motor'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    enviarComando("/mover/0"), // Mover para 0 graus
                child: Text("Mover para 0 graus"),
              ),
              SizedBox(
                  height:
                      20), // Adiciona um espaçamento de 20 pixels entre as colunas
              ElevatedButton(
                onPressed: () =>
                    enviarComando("/mover/90"), // Mover para 90 graus
                child: Text("Mover para 90 graus"),
              ),
              SizedBox(
                  height:
                      20), // Adiciona um espaçamento de 20 pixels entre as colunas
              ElevatedButton(
                onPressed: () =>
                    enviarComando("/mover/180"), // Mover para 180 graus
                child: Text("Mover para 180 graus"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void enviarComando(String command) async {
    final url = Uri.http(serverIp, command);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Comando enviado com sucesso');
      } else {
        print('Erro ao enviar comando');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
