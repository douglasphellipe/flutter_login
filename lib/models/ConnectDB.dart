import 'package:http/http.dart' as http;

class ConnectDB {
  final String baseUrl = "http://localhost/flutter/conexao.php";

  Future<String> conexao(String host, String database, String user, String pass) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        "host": host,
        "database": database,
        "user": user,
        "pass": pass,
      },
    );

    if (response.statusCode == 200) {
      return response.body; // Retorna o objeto PDO em formato de texto
    } else {
      throw Exception("Falha na conexão");
    }
  }
}
