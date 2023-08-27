import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color bgColor = Colors.black,
  Color txtColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    // timeInSecForIosWeb: 2,
    backgroundColor: bgColor,
    textColor: txtColor,
    fontSize: 16,
  );
}
