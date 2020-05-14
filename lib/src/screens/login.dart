import 'package:flutter/material.dart';
import '../mixins/validator_mixins.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidatorMixin{
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitMethod(),
          ],
        )
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password'
      ),
      validator: valdatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitMethod() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if(formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}