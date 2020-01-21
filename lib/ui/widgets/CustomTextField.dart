import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  final String hint;
  final IconData icon;

  CustomTextField({@required this.controller, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(),
        child: TextField(
          decoration: InputDecoration(
            hintText: this.hint,
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