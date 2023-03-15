import 'package:flutter/material.dart';




class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key, String? title}) : super(key: key);
  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State< PlanningScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calendar Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}