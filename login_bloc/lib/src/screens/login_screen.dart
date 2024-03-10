import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            emailField(bloc),
            SizedBox(
              height: 20,
            ),
            passwordField(bloc),
            SizedBox(
              height: 20,
            ),
            button(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.emailChanged,
          decoration: InputDecoration(
            hintText: 'your@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordChanged,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget button(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: Text('Login'),
          onPressed: snapshot.hasData ? bloc.submit : null,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
          ),
        );
      },
    );
  }
}
