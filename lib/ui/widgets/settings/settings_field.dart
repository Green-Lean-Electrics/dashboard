import 'package:dashboard/core/utils/validators.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

class SettingsField extends StatelessWidget {
  final String title;
  final String description;
  final dynamic initialData;
  final IconData icon;
  final Function(dynamic) onChange;
  final Function(String) validator;
  final bool obscureText;
  final bool showDescription;
  final Widget customField;

  SettingsField({
    @required this.title,
    this.description,
    this.onChange,
    this.icon,
    this.validator = Validators.lengthValidator,
    this.obscureText = false,
    this.showDescription = true,
    this.customField,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    TextFormField textField = TextFormField(
      decoration: InputDecoration(icon: Icon(icon), labelText: title),
      keyboardType: TextInputType.text,
      initialValue: initialData,
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
    );

    Widget _buildFieldInformation(CrossAxisAlignment alignment) {
      return Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: alignment,
          children: <Widget>[
            Text(showDescription ? title : '',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(showDescription ? description : ''),
          ],
        ),
      );
    }

    return ScreenTypeLayout(
      desktop: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildFieldInformation(CrossAxisAlignment.end),
            Container(
              width: 300,
              child: customField ?? textField,
            ),
          ]),
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildFieldInformation(CrossAxisAlignment.start),
            Container(height: 20, width: 0),
            Container(
              width: 300,
              child: customField ?? textField,
            ),
          ],
        ),
      ),
    );
  }
}
