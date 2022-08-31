import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/register.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState(){
    super.initState();

    firebaseAuth.authStateChanges().listen((User? user) {
      if(user==null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
      }
      else {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      actions: [
        IconButton(onPressed: (){
          firebaseAuth.signOut();
        }, icon: Icon(Icons.logout)),
      ],
      ),
    );
  }
}
