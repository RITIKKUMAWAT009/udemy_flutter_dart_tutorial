import 'package:flutter/material.dart';
import '../mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> with ValidatorMixin {
  var formKey = GlobalKey<FormState>();
  String? email = '';
  String? password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              SizedBox(
                height: 30,
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'your@example.com',
      ),
      validator: emailValidatoin,
      onSaved: (value) {
        email = value;
      },
    );
  }

  passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Password', hintText: 'Enter your password'),
      obscureText: true,
      validator: passwordValidation,
      onSaved: (value) {
        password = value;
      },
    );
  }

  loginButton() {
    return ElevatedButton(
      onPressed: () => {
        if (formKey.currentState!.validate())
          {
            formKey.currentState!.save(),
            print('email :$email and password : $password'),
          }
      },
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(10),
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
      ),
      child: const Text('SUBMIT'),
    );
  }
}
