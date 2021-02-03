import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stepper_controller.dart';

abstract class StepperPage<Page extends StatefulWidget, T> extends State<Page> {
  final controller = Modular.get<StepperController<T>>();
}
