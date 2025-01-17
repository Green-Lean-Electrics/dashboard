import 'dart:typed_data';

import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/utils/validators.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/shared/green_lean_icons.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:dashboard/ui/widgets/settings/profile_picture_picker.dart';
import 'package:dashboard/ui/widgets/settings/settings_field.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  final User currentUser;
  final bool isLoading;
  final Function(String, String, String, Uint8List) onUserUpdated;

  SettingsForm({
    Key key,
    @required this.currentUser,
    @required this.isLoading,
    @required this.onUserUpdated,
  }) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password = '';
  Uint8List _image;

  @override
  void initState() {
    super.initState();
    _name = widget.currentUser.name;
    _email = widget.currentUser.email;
  }

  @override
  Widget build(BuildContext context) {
    Widget formBody = Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              GreenLean.power,
              size: 50,
            ),
            Container(width: 15),
            Text('Your GLE profile', style: TextStyle(fontSize: 30))
          ],
        ),
      ),
      Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SettingsField(
                  title: 'Picture',
                  description: 'Your profile picture, smile!',
                  initialData: '',
                  customField: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ScreenTypeLayout(
                        mobile: Container(width: 100, height: 0),
                        desktop: Container(width: 30, height: 0),
                      ),
                      ProfilePicturePicker(
                        pictureURL:
                            'https://pure-badlands-64215.herokuapp.com' +
                                widget.currentUser.profilePictureURL,
                        onImageUpdated: (image) => _image = image,
                      ),
                      ScreenTypeLayout(
                        mobile: Container(width: 100, height: 0),
                        desktop: Container(width: 170, height: 0),
                      ),
                    ],
                  ),
                ),
                SettingsField(
                  title: 'Name',
                  description: 'Your first and last name',
                  initialData: widget.currentUser.name,
                  icon: Icons.person,
                  onChange: (value) => _name = value,
                ),
                SettingsField(
                  title: 'Email',
                  description: 'An email address we can\nuse to get in touch',
                  initialData: widget.currentUser.email,
                  icon: Icons.email,
                  onChange: (value) => _email = value,
                ),
                SettingsField(
                  title: 'New password',
                  description: 'Keep it safe and secure',
                  initialData: '',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value.length != 0) {
                      return Validators.lengthValidator(value);
                    }
                    return null;
                  },
                  onChange: (value) => _password = value,
                ),
                SettingsField(
                  title: 'Repeat new password',
                  description: '',
                  showDescription: false,
                  initialData: '',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (_password.length != 0) {
                      if (value != _password) {
                        return 'Passwords don\'t match';
                      }
                    }
                    return null;
                  },
                ),
              ],
            ),
            widget.isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: GreenLeanProgressIndicator(size: 40),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: OutlineButton(
                      child: Text(
                        "SAVE CHANGES",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          widget.onUserUpdated(
                            _name,
                            _email,
                            _password,
                            _image,
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 10, color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  )
          ],
        ),
      ),
    ]);
    return ScreenTypeLayout(
      desktop: Card(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: formBody,
        ),
      ),
      mobile: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: formBody,
      ),
    );
  }
}
