import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final _auth = FirebaseAuth.instance;

  String hashPassword(String password) {
  var bytes = utf8.encode(password); // Convert password to bytes
  var digest = sha256.convert(bytes); // Hash the bytes
  return digest.toString(); // Return the hash as a string
}




  Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _saveUserData(userCredential.user);
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi gagal: ${e.toString()}')),
      );
    }
  }

  Future<void> _saveUserData(User? user) async {
    String hashedPassword = hashPassword(_passwordController.text);
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': hashedPassword,
      });
    }
    // Clear the text fields
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
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
