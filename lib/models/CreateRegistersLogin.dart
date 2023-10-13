import 'package:http/http.dart' as http;

class CreateTableRegistersLogin {
  final String baseUrl = "http://localhost/flutter/createTableRegistersLogin.php";

  Future<void> createTable(String pdo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        "pdo": pdo, // Envia o objeto PDO como uma string
      },
    );

    if (response.statusCode == 200) {
      print("Tabela 'registers_login' criada com sucesso: ${response.body}");
    } else {
      print("Falha ao criar a tabela 'registers_login'");
    }
  }
}
