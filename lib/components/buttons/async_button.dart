

import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';

import '../progress/default_progress.dart';


class GroupAsyncButton extends StatelessWidget {

  final Future Function()? onPressed;
  final Widget child;
  final Color loadingColor;
  const GroupAsyncButton({Key? key, this.onPressed, required this.child, this.loadingColor = Colors.blue}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AsyncButtonBuilder(
      onPressed: onPressed,
      child: child,
      builder: (BuildContext context,
          Widget child, Future<void> Function()? callback,
          ButtonState buttonState) {
        return TextButton(
          child: child,
          onPressed: callback,
        );
      },

      loadingWidget: Center(child: GroupProgress.groupProgress(),)
    );
  }
}
