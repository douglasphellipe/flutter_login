import "package:login_flutter/models/ConnectDB.dart" as connect;
import "package:login_flutter/models/CreateRegistersLogin.dart" as create;
import "package:login_flutter/models/InsertRegisters.dart" as insert;

Future setupDatabase() async {
  final connectDB = connect.ConnectDB();
  final host = 'localhost';
  final database = 'flutter';
  final user = 'root';
  final pass = '';

  try {
    final pdo = await connectDB.conexao(host, database, user, pass);

    // Chama a função "createTable" com o objeto PDO
    final createTable = create.CreateTableRegistersLogin();
    await createTable.createTable(pdo);

    return pdo;
  } catch (e) {
    print("Erro na conexão ou criação da tabela: $e");
    return null;
  }
}

void inserirRegistros(pdo, fields, table) {
  final insertRegisters = insert.InsertRegistersToTable();
  // Chama a função para inserir no banco com os parâmetros fornecidos
  insertRegisters.insertRegisters(pdo, fields, table);
}
