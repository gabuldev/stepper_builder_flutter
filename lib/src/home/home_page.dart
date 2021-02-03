import 'package:flutter/material.dart';

import 'package:stepper_builder/src/stepper/stepper_builder.dart';

import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';

class YourObject {
  final String name;
  final String people;
  final String cpf;
  YourObject({
    this.name,
    this.people,
    this.cpf,
  });

  YourObject copyWith({
    String name,
    String people,
    String cpf,
  }) {
    return YourObject(
      name: name ?? this.name,
      people: people ?? this.people,
      cpf: cpf ?? this.cpf,
    );
  }

  @override
  String toString() => 'YourObject(name: $name, people: $people, cpf: $cpf)';
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var completedData;

  void updateData(var data) {
    completedData = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$completedData"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StepperBuilder<YourObject>(
                  onFinish: updateData,
                  initial: YourObject(),
                  steps: {
                    "/1": (context) => Page1(),
                    "/2": (context) => Page2(),
                    "/3": (context) => Page3(),
                  },
                ),
              ));
        },
      ),
    );
  }
}
