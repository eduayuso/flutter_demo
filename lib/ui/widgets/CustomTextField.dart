import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  final String hint;
  final IconData icon;
  final String errorText;
  final bool validation;

  CustomTextField({@required this.controller, this.icon, this.hint, this.errorText, this.validation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(),
        child: TextField(
          decoration: InputDecoration(
            hintText: this.hint,
            errorText: this.validation ? null : this.errorText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).accentColor, width: 1.0
              )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).accentColor, width: 1.0
              )
            ),
            prefixIcon: this.icon != null
              ? Icon(this.icon, color: Colors.blueGrey)
              : null
          ),
          controller: this.controller
        ),
      ),
    );
  }
}