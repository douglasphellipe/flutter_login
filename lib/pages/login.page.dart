import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              onPressed: () => {},
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