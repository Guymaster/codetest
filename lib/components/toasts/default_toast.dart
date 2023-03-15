


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/utils/colors.dart';

class GroupSnack{

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnack(
      String error, context, size, isError) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: isError ? Colors.red : secondaryColor,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }

}