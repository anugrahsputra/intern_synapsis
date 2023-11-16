import 'package:flutter/material.dart';

class CustomDialog {
  CustomDialog._();

  static show(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _customDialog(context),
          );
        });
  }

  static hide(BuildContext context) {
    Navigator.pop(context);
  }

  static _customDialog(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation(Color(0xff1FA0C9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
