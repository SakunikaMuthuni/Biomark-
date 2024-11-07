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