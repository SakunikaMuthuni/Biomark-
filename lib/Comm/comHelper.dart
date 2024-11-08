import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void alertDialog(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM, // You can change this to ToastGravity.CENTER or ToastGravity.TOP
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.blueGrey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

bool validateEmail(String email){
  final RegExp emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}