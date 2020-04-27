import 'package:dashboard/core/utils/validators.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:dashboard/ui/widgets/login/location_selector.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatefulWidget {
  final Function(String, String, String, LatLng) onSignUp;
  final bool isLoading;

  SignUpForm({
    @required this.onSignUp,
    @required this.isLoading,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _locationController;
  String _name;
  String _email;
  String _password;
  LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name',
            ),
            keyboardType: TextInputType.multiline,
            onChanged: (String value) => _name = value,
            validator: Validators.lengthValidator,
          ),
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
          TextFormField(
            decoration: InputDecoration(
              focusColor: Colors.white,
              icon: Icon(Icons.lock),
              labelText: 'Repeat password',
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value != _password) {
                return "Password doesn\'t match";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              focusColor: Colors.white,
              icon: Icon(Icons.location_on),
              labelText: 'Select household location',
            ),
            controller: _locationController,
            readOnly: true,
            onTap: () => showDialog(
              context: context,
              builder: (context) => LocationSelector(
                  onSelected: (location) {
                    _selectedLocation = location;
                    _locationController.text = location.toSexagesimal();
                  },
                  selectedLocation: _selectedLocation),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return "Select a location";
              } else {
                return null;
              }
            },
          ),
          Container(width: 0, height: 15),
          widget.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GreenLeanProgressIndicator(size: 40),
                )
              : OutlineButton(
                  child: Text("SIGN UP"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      widget.onSignUp(
                          _name, _email, _password, _selectedLocation);
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
