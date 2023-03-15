

import 'package:flutter/material.dart';


class LogOutDialog extends StatefulWidget {
  final Function()? onPressed;
  const LogOutDialog({Key? key, this.onPressed}) : super(key: key);

  @override
  _LogOutDialogState createState() => _LogOutDialogState();
}

class _LogOutDialogState extends State<LogOutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Voulez-vous vraiment vous déconnecter ?', style: TextStyle(fontSize: 15),),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),

        actions: <Widget>[
          FlatButton(
            child: const Text('Annuler'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textColor: Theme.of(context).accentColor,
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: const Text('Se déconnecter'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textColor: Theme.of(context).accentColor,
            onPressed: widget.onPressed,
          ),
        ]
    );
  }



}
