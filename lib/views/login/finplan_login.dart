import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you would usually call your authentication method
      print('Email: $_email, Password: $_password');
      // Implement your login logic here
    }
  }

  void _forgotPassword() {
    print('Forgot Password Clicked');
  }

  void _register() {
    print('Register Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'lib/res/images/finplan_logo.png', // Ganti dengan path gambar Anda
                height:250, // Tinggi gambar
                width: 290, // Lebar gambar
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: const Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: const Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(onPressed: _forgotPassword, 
                child: Text('Lupa Password?'),
                style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              )),
              ]),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, fixedSize: Size(220, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ), 
              ),
               SizedBox(height: 20),
               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                 Text('Belum Punya Akun?'),
                 TextButton(onPressed: _register, child: 
                 Text('Daftar Sekarang'),
                 style: TextButton.styleFrom(
                 foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                 textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                 )),
               ]),
            ],
          ),
        ),
      ),
    );
  }
}
