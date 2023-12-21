import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
/* Returns status if device has internet available.
* Return true if network available otherwise false.
* */
  // static Future<bool> isConnected() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }

  // Return string date with  datetime in format.
  static String getFormattedDate(DateTime? date) {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yy HH:mm:ss');
    String formattedDate = formatter.format(date ?? now);
    return formattedDate;
  }

  // Error snack bar
  static void showErrorMessage(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      elevation: 4,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Text(message),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }
}

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}
