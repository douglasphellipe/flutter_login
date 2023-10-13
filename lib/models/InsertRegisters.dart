import 'package:http/http.dart' as http;

class InsertRegistersToTable {

Future<void> insertRegisters(String pdo, Map<String, dynamic> fields, String table) async {
  final url = Uri.parse('http://localhost/flutter/insertRegistersToTable.php'); // Substitua pela URL correta da sua API
  final headers = {"Content-Type": "application/x-www-form-urlencoded"};

  // Prepare os campos a serem enviados no corpo da solicitação
  final Map<String, dynamic> requestBody = {
    "pdo": pdo,
    "fields": fields,
    "table": table,
  };

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print("Registro inserido com sucesso.");
    } else {
      print("Erro ao inserir o registro. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Erro na solicitação HTTP: $e");
  }
}
}
