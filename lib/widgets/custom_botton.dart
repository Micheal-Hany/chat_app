import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.nameOfButton, this.onTap});
  String? nameOfButton;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7, right: 7),
      child: GestureDetector(
        
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
            child: Center(
              child: Text(
                "$nameOfButton",
                style: TextStyle(color: Color(0xff2B475E), fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
