import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/register.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                ' Login ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email ',
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password ',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (String? value) {
                  return (value != null) ? 'اكتب ياعم ياسورد' : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  try {
                    UserCredential credential =
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-email') {
                      //snackbar
                    }
                  }
                },
                color: Colors.teal,
                child: const Text('Login'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: const Text('Register '))
            ],
          ),
        ),
      ),
    );
  }
}
