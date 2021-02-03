import 'package:flutter/material.dart';
import 'package:stepper_builder/src/home/home_page.dart';
import 'package:stepper_builder/src/stepper/stepper_page.dart';

class Page2 extends StatefulWidget {
  const Page2({
    Key key,
  }) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends StepperPage<Page2, YourObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.next((model) => model.copyWith(name: "Gabul Savul"));
        },
      ),
      body: Container(
        color: Colors.red,
        child: Center(child: Text(controller.data.toString())),
      ),
    );
  }
}
