import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_drive/views/login/finplan_login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      // Add user data to Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text, // Store hashed password in production
      });

      // Clear the text fields
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully!')),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())
      );
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'lib/res/images/finplan_logo.png',
                  height: 250,
                  width: 290,
                ),
              ),
              const Center(
                child: Text(
                  'REGISTRASI',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1),
                  filled: true,
                ),
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
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1),
                  filled: true,
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1),
                  filled: true,
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 35),
              Center(
                child: ElevatedButton(
                  onPressed: _register,
                  child: const Text('Registrasi'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: const Size(220, 50),
                    backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
