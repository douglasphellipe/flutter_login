import 'package:flutter/material.dart';
import 'package:login_flutter/controllers/DB.dart' as db_connect;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final TextEditingController cpfController = TextEditingController();
   dynamic pdo; // Para armazenar o objeto PDO

 @override
  void initState() {
    super.initState();
    // Chama a função para configurar o banco de dados e obter o objeto PDO
    db_connect.setupDatabase().then((value) {
      if (value != null) {
        setState(() {
          pdo = value; // Armazena o objeto PDO
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: cpfController,
              autofocus: true,
              keyboardType: TextInputType.number,
              style: new TextStyle(color: Colors.white, fontSize: 12),
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(color: Colors.white),
              ),  
            ),
            Divider(),
              TextFormField(
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.text,
              style: new TextStyle(color: Colors.white, fontSize: 12),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
              ),  
            ),
          Divider(),
          ButtonTheme(
            height: 60.0,
            child: ElevatedButton(
              onPressed: () => {
                 db_connect.inserirRegistros(pdo, {"cpf": cpfController.text}, "registers_login")
              },
              child: Text(
                "Logar",
                style: TextStyle(color: Colors.blueGrey),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
              ),
            ),
          )
          ],
        ),
      ),
      )
    );
  }
}