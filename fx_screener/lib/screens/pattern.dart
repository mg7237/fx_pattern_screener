import 'package:flutter/material.dart';

class Pattern extends StatefulWidget {
  const Pattern({Key? key}) : super(key: key);

  @override
  _PatternState createState() => _PatternState();
}

class _PatternState extends State<Pattern> {
  bool paidUser = false;
  TextStyle style = TextStyle(fontSize: 18, fontFamily: 'Poppins');
  bool allType = false;
  bool rectangle = false;
  bool triangle = false;
  bool wedge = false;
  bool flag = false;
  bool pennant = false;
  bool head = false;
  bool double = false;
  bool triple = false;
  bool butterfly = false;

  changeAllSwitch(bool value) {
    setState(() {
      allType = value;
      rectangle = value;
      triangle = value;
      wedge = value;
      flag = value;
      pennant = value;
      head = value;
      double = value;
      triple = value;
      butterfly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('All Type', style: style),
                    ],
                  ),
                  Switch(
                      value: allType,
                      onChanged: (value) => changeAllSwitch(value))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Rectangle', style: style),
                    ],
                  ),
                  Switch(
                      value: rectangle,
                      onChanged: (value) => setState(() {
                            rectangle = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Triangle', style: style),
                    ],
                  ),
                  Switch(
                      value: triangle,
                      onChanged: (value) => setState(() {
                            rectangle = triangle;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Wedge', style: style),
                    ],
                  ),
                  Switch(
                      value: wedge,
                      onChanged: (value) => setState(() {
                            rectangle = wedge;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Flag', style: style),
                    ],
                  ),
                  Switch(
                      value: flag,
                      onChanged: (value) => setState(() {
                            flag = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Pennant', style: style),
                    ],
                  ),
                  Switch(
                      value: pennant,
                      onChanged: (value) => setState(() {
                            pennant = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Head and Shoulders', style: style),
                    ],
                  ),
                  Switch(
                      value: head,
                      onChanged: (value) => setState(() {
                            head = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Double Top /Bottom', style: style),
                    ],
                  ),
                  Switch(
                      value: double,
                      onChanged: (value) => setState(() {
                            double = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Triple Top and Bottom', style: style),
                    ],
                  ),
                  Switch(
                      value: triple,
                      onChanged: (value) => setState(() {
                            triple = value;
                          }))
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Color(0xff1DBF73)),
                      SizedBox(width: 10),
                      Text('Butterfly', style: style),
                    ],
                  ),
                  Switch(
                      value: butterfly,
                      onChanged: (value) => setState(() {
                            butterfly = value;
                          }))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
