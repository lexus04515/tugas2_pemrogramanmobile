import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;

 _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(username: _username, nickname: _nickname)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  TextFormField(
                enabled: true,
                onChanged: (value) {
                  _nickname = value;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Panggilan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Username',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue))),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isClicked == true
                ? WidgetStateProperty.all(Colors.blue)
                : WidgetStateProperty.all(
                    const Color.fromARGB(255, 243, 0, 0))),
        onPressed: () {
          if (_username == "flutter" && _password == "321") {
            _navigateToHome();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login Berhasil')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Username atau Password Salah')));

            setState(() {
              isClicked = !isClicked;
              print(isClicked);
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
