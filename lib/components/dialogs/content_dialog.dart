import 'package:groupe/utils/colors.dart';
import 'package:flutter/material.dart';



class RoundedAlertBox extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Widget content;
  final Function() onPressed;
  const RoundedAlertBox({Key? key, required this.title, required this.content, required this.onPressed, required this.buttonTitle}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: SizedBox(
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(''),
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.cancel_outlined, color: Colors.white,),
                      )
                    ],
                  )
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: content,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0)),
                ),
                child: Text(
                  buttonTitle,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}