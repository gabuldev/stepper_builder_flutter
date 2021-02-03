import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StepperController<T> {
  final size;

  List<String> routes = <String>[];

  final pagesNotifier = ValueNotifier<List<String>>(<String>[]);
  List<String> get pages => pagesNotifier.value;
  set pages(List<String> pages) => pagesNotifier.value = pages;

  bool isPush = false;

  T data;
  StepperController(this.size);

  void previous() {
    if (pages.length > 1) {
      final actual = pages;
      actual.removeLast();
      pages = List.from(actual);
    } else {
      Modular.to.pop();
    }
  }

  void next([T Function(T actualData) onChange]) {
    if (isPush == false) {
      if (pages.length < size) {
        final actual = pages;
        actual.add(routes[actual.length]);
        pages = List.from(actual);
      } else {
        pages = List.from([]);
        Modular.to.pop();
      }
    } else {
      previous();
      isPush = false;
    }

    final newData = onChange(data);
    if (newData != null) {
      data = newData;
    }
  }

  void push(String route, [T Function(T actualData) onChange]) {
    final index = routes.indexWhere((element) => element == route);
    final actual = pages;
    actual.add(routes[index]);
    pages = List.from(actual);
    isPush = true;

    final newData = onChange(data);
    if (newData != null) {
      data = newData;
    }
  }
}
