import 'package:flutter/material.dart';

class CustomFormTextFeiled extends StatelessWidget {
  CustomFormTextFeiled(
      {this.lableText, this.onChange, this.obsecureText = false});
  String? lableText;
  Function(String)? onChange;
  bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 7, right: 7),
        child: TextFormField(
          obscureText: obsecureText!,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Filed is required';
            }
          },
          style: TextStyle(color: Colors.white),
          onChanged: onChange,
          decoration: InputDecoration(
              labelText: '$lableText',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              labelStyle: TextStyle(color: Colors.white, letterSpacing: 1.5),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}
