



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupNavigation{
  static to(BuildContext context, Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => widget),
    );
  }

  static destroy(BuildContext context){
    Navigator.pop(context);
  }
}

//pour aller vers une autre page appelle ===> GroupNavigation.to(context, widget)
//pour detruire une page appelle ===> GroupNavigation.destroy(context)