import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  final String hint;
  final IconData icon;
  final Function validator;

  CustomTextFormField({@required this.controller, this.icon, this.hint, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(),
        child: TextFormField(
            controller: this.controller,
            decoration: new InputDecoration(
                hintText: this.hint,
                prefixIcon: this.icon != null
                    ? Icon(this.icon, color: Colors.blueGrey)
                    : null
            ),
            validator: this.validator,
        ),
      ),
    );
  }
}