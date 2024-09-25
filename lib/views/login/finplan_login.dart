import 'package:flutter/material.dart';
import 'package:test_drive/views/registrasi/finplan_registrasi.dart';
import 'package:test_drive/views/forgot password/finplan_forgot_password.dart';

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassPage()));
  }

  void _register() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
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
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
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
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(onPressed: _forgotPassword,
                style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ), 
                child: const Text('Lupa Password?')),
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, fixedSize: const Size(220, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Login'), 
              ),
               const SizedBox(height: 20),
               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                 const Text('Belum Punya Akun?'),
                 TextButton(onPressed: _register,
                 style: TextButton.styleFrom(
                 foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                 textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                 ), child: 
                 const Text('Daftar Sekarang')),
               ]),
            ],
          ),
        ),
      ),
    );
  }
}
