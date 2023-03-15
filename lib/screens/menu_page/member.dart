import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xf6f8fb),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}