import 'bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();
  Provider({super.key, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    final provider=context.dependOnInheritedWidgetOfExactType<Provider>();
    return provider!.bloc;
  }
}
