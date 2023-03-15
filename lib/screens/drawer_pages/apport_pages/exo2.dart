// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _contributions = ["Scolaire", "Appareils", "Immobilier", "Fêtes"];

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: Center(
        child: Container(
          width: 360,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color: Color(0xFFe6e6e6),
            borderRadius: BorderRadius.circular(5.5),

          ),
          child: DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                _selectedColor = value;
              });
            },
            value: _selectedColor,

            // Hide the default underline
            underline: Container(),
            hint: Center(
                child: Text(
                  'Choisissez une contribution',
                  style: TextStyle(color: Colors.grey),
                )),
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              color: Color(0xFF0e3664),
            ),
            isExpanded: true,

            // The list of options
            items: _contributions
                .map((e) => DropdownMenuItem(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  e,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              value: e,
            ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _contributions
                .map((e) => Center(
              child: Text(
                e,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0e3664),
                    fontWeight: FontWeight.bold),
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}