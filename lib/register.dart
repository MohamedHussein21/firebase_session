
import 'package:firebase_session/home.dart';
import 'package:firebase_session/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'componant.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
          return ChangeNotifierProvider<MyProvider>(
            create: (context)=> MyProvider(),
            builder: (context,_){
              return Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text('Register',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )),
                                  SizedBox(height: 15,),
                                  Text(
                                      'Register Now To Connected With your friends',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Name';
                                }
                                return null;
                              },
                              label: 'Name',
                              prefix: Icons.account_circle,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Email';
                                }
                                return null;
                              },
                              label: 'Email',
                              prefix: Icons.email,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                                controller: passwordController,
                                type: TextInputType.text,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Password';
                                  }
                                  return null;
                                },
                                label: 'Password',
                                prefix: Icons.lock,
                                isPassword: Provider.of<MyProvider>(context).isShowPass,
                                suffix: Provider
                                    .of<MyProvider>(context)
                                    .suffix,
                                onSubmit: (value) {},
                                suffixPressed: () {
                                  Provider.of<MyProvider>(context,listen: false)
                                      .changePassVisibility();
                                }
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Phone';
                                }
                                return null;
                              },
                              label: 'Phone',
                              prefix: Icons.phone,
                            ),




                            const SizedBox(
                              height: 30,
                            ),

                            MaterialButton(
                              elevation: 0,
                              minWidth: double.maxFinite,
                              height: 50,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Provider.of<MyProvider>(context,listen: false)
                                      .userRegister
                                    (name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

                                }

                              },
                              color: Colors.blue,
                              child: const Text('Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              textColor: Colors.white,
                            ),




                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },

          );



  }
}
