import 'package:flutter/material.dart';
import 'package:stepper_builder/src/home/home_page.dart';
import 'package:stepper_builder/src/stepper/stepper_page.dart';

class Page1 extends StatefulWidget {
  const Page1({
    Key key,
  }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends StepperPage<Page1, YourObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.next((model) => model.copyWith(cpf: "1233456"));
        },
      ),
      body: Container(
        color: Colors.green,
        child: Center(child: Text(controller.data.toString())),
      ),
    );
  }
}
