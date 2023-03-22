import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    _emailController.text = 'aziz@test.com';
    _passwordController.text = 'password';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: (value) => value!.isEmpty ? 'please enter valid email' : null),
              TextFormField(
                  controller: _passwordController,
                  validator: (value) => value!.isEmpty ? 'please enter password' : null),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                //minWidth: double.infinity,
                //color: Colors.blue,
                child: const Text('Login', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Map creds = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': 'mobile',
                  };
                  if (_formKey.currentState!.validate()) {
                    Provider.of<Auth>(context, listen: false)
                        .login(creds: creds);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),




    );
  }
}
