import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xseed_app/home/bloc/drawer_bloc.dart';

import '../../main.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.controller});
  final PageController controller;

  @override
  State<Question> createState() => _QuestionState();
}
// enum Options{a,b,c,d,none}

class _QuestionState extends State<Question> {
  // Options? _answer = Options.none;
  String question =
      "An Automobile rounds a curve of radius 50.0 m on a flat road. The centripetal acceleration to keep the car on the curve is 3.92m/s_2. What is the speed necessary to keep the car on the curve?";
  // bool enableCross = false;
  String answer = "c";
  String selectedAnswer = "o";
  checkAnswer(String option) {
    if (option != "c") {
      Scaffold.of(context).openEndDrawer();
      // setState(() {
      //   enableCross = true;
      // });
    } else {
      // setState(() {
      //   enableCross = true;
      // });
      Timer(const Duration(seconds: 1), () {
        if (widget.controller.page == 3) {
          debugPrint("IIIIIIIIIIIIII");
          Navigator.pop(context, true);
          // .then((value) {
          //   // Display a snackbar.
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Value: $value')));
          // });
          // Scaffold scaffold = Scaffold.of(context);
          // findAncestorStateOfType<MyHomePage>();
          // Open the drawer.
          // globalScaffoldKey.currentState!.openDrawer();
          // debugPrint("${globalScaffoldKey.currentState}");
        } else {
          BlocProvider.of<DrawerBloc>(context).add(UnlockTopic());
          widget.controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(question),
          SizedBox(
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                // checkAnswer("a");
                setState(() {
                  selectedAnswer = "a";
                });
                checkAnswer("a");
              },
              child: ListTile(
                leading: Text("a"),
                title: Text("7 m/s"),
                trailing: selectedAnswer == "a"
                    ? Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(
            width: 500,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedAnswer = "b";
                  });
                  checkAnswer("b");
                },
              child: ListTile(
                leading: Text("b"),
                title: Text("10 m/s"),
                trailing: selectedAnswer == "b"
                    ? Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswer = "c";
                });
                checkAnswer("c");
              },
              child: ListTile(
                leading: Text("c"),
                title: Text("14 m/s"),
                trailing: selectedAnswer == "c"
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswer = "d";
                });
                checkAnswer("d");
              },
              child: ListTile(
                leading: Text("d"),
                title: Text("18 m/s"),
                trailing: selectedAnswer == "d"
                    ? Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                    : null,
              ),
            ),
          ),
          // Text('Female'),
        ],
      ),
    );
  }
}
