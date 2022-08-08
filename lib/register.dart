import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/home.dart';
import 'package:firebase_session/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name, email, password;
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
                ' Register ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name ',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (String? value) {
                  return (value != null) ? 'اكتب اسمك ياحجوج' : null;
                },
              ),
              const SizedBox(
                height: 20,
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
                        await firebaseAuth.createUserWithEmailAndPassword(
                            email: email!, password: password!);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  } on FirebaseAuthException catch (erorr) {
                    if (erorr.code == 'email-already-in-use') {
                      //snackbar
                    }
                    if (erorr.code == 'invalid-email') {}
                  }
                },
                color: Colors.teal,
                child: const Text('Register'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text('I Have account'))
            ],
          ),
        ),
      ),
    );
  }
}
