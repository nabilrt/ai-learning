import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_application/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLoggedIn = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailandPassword() async {
    try {
      await Auth().signInWithEmailandPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailandPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("Login Page");
  }

  Widget _emailField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage ?? '');
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (isLoggedIn) {
            signInWithEmailandPassword();
          } else {
            createUserWithEmailAndPassword();
          }
        },
        child: Text(isLoggedIn ? "Login" : "Sign Up"));
  }

  Widget _changeLoginButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLoggedIn = !isLoggedIn;
          });
        },
        child: Text(isLoggedIn
            ? "Don't have an account? Sign Up"
            : "Already have an account? Login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _emailField("Email", emailController),
              const SizedBox(height: 20),
              _emailField("Password", passwordController),
              const SizedBox(height: 20),
              _errorMessage(),
              const SizedBox(height: 20),
              submitButton(),
              const SizedBox(height: 20),
              _changeLoginButton()
            ],
          )),
    );
  }
}
