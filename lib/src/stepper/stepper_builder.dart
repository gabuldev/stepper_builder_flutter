import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:stepper_builder/src/stepper/stepper_controller.dart';

class StepperBuilder<T> extends WidgetModule {
  final Map<String, Function(BuildContext context)> steps;
  final List<String> activeSteps;
  final T initial;
  final Function(T data) onFinish;
  StepperBuilder({
    @required this.steps,
    this.activeSteps,
    @required this.initial,
    this.onFinish,
  });
  @override
  List<Bind> get binds => [
        Bind((i) => StepperController<T>(steps.length)),
      ];

  @override
  Widget get view => _StepperWidget<T>(
        steps: steps,
        activeSteps: activeSteps,
        initial: initial,
        onFinish: onFinish,
      );
}

class _StepperWidget<T> extends StatefulWidget {
  final Map<String, Function(BuildContext context)> steps;
  final List<String> activeSteps;
  final T initial;
  final Function(T data) onFinish;
  _StepperWidget({
    Key key,
    @required this.steps,
    this.activeSteps,
    @required this.initial,
    @required this.onFinish,
  }) : super(key: key);

  @override
  _StepperBuilderState<T> createState() => _StepperBuilderState<T>();
}

class _StepperBuilderState<T> extends State<_StepperWidget<T>> {
  final _controller = Modular.get<StepperController<T>>();

  void _mountInitialPage() {
    _controller.data = widget.initial;
    _controller.routes = widget.steps.entries.map((e) => e.key).toList();
    _controller.pagesNotifier.value = [_controller.routes.first];
  }

  @override
  void initState() {
    _mountInitialPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _controller.previous();
        return false;
      },
      child: Scaffold(
          body: ValueListenableBuilder<List<String>>(
        valueListenable: _controller.pagesNotifier,
        builder: (_, pages, __) => pages.isNotEmpty
            ? Navigator(
                onPopPage: (route, result) {
                  return route.didPop(result);
                },
                pages: pages
                    .map((e) => MaterialPage(
                            child: Builder(
                          builder: widget.steps[e],
                        )))
                    .toList(),
              )
            : Container(),
      )),
    );
  }
}
