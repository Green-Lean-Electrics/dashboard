import 'package:dashboard/core/utils/validators.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  final Function(String, String) onLogin;
  final bool isLoading;

  LoginForm({
    @required this.onLogin,
    @required this.isLoading,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) => _email = value,
            validator: Validators.lengthValidator,
          ),
          TextFormField(
            decoration: InputDecoration(
              focusColor: Colors.white,
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            onChanged: (String value) => _password = value,
            validator: Validators.lengthValidator,
          ),
          Container(width: 0, height: 15),
          widget.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GreenLeanProgressIndicator(size: 40),
                )
              : OutlineButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      widget.onLogin(_email, _password);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 10, color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
        ],
      ),
    );
  }
}
