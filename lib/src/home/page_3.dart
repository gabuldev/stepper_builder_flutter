import 'package:flutter/material.dart';
import 'package:stepper_builder/src/home/home_page.dart';
import 'package:stepper_builder/src/stepper/stepper_page.dart';

class Page3 extends StatefulWidget {
  const Page3({
    Key key,
  }) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends StepperPage<Page3, YourObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.next();
        },
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.data.toString()),
            FlatButton(
              child: Text("Alterar Step 1"),
              onPressed: () {
                controller.push("/1", (model) => model.copyWith(cpf: "999999"));
              },
            )
          ],
        ),
      ),
    );
  }
}
