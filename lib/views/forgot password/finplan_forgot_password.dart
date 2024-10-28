import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPage createState() => _ForgotPassPage();
}

class _ForgotPassPage extends State<ForgotPassPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _forgotpassword() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you would usually call your authentication method
      print('Email: $_email, Password: $_password');
      // Implement your login logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: ClipOval(
              child: Image.asset('lib/res/images/finplan_ic_back.png'),
            ),
          ),
        ),
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
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Konfirmasi Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _forgotpassword,
                child: Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, fixedSize: Size(220, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
