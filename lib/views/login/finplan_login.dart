import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/views/dashboard/finplan_dashboard.dart';
import 'package:test_drive/views/registrasi/finplan_registrasi.dart';
import 'package:test_drive/views/forgot password/finplan_forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _email;
  String? _password;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email!,
            password: _password!,
          );
        User? user = _auth.currentUser;
        if (user != null) {
          DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          if (snapshot.exists) {
            var userData = snapshot.data() as Map<String, dynamic>;
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("name", userData['name']);
            await prefs.setString("email", userData['email']);

            Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User not found!')),
            );
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Authentication failed!')),
          );
        }
      } catch (e) {
          print('Error: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${e.toString()}')),
          );
      }
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
                'lib/res/images/finplan_logo.png',
                height: 250,
                width: 290,
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
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
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
                onSaved: (value) => _email = value,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1),
                  filled: true,
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _forgotPassword,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Lupa Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(220, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum Punya Akun?'),
                  TextButton(
                    onPressed: _register,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(151, 151, 151, 1),
                      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Daftar Sekarang'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
