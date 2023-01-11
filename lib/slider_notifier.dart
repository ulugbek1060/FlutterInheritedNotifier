import 'package:flutter/cupertino.dart';

class SliderData extends ChangeNotifier {
  double _value = 0.0;

  double get value => _value;
  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

class SliderNotifier extends InheritedNotifier<SliderData> {
  const SliderNotifier({
    Key? key,
    required SliderData sliderData,
    required Widget child,
  }) : super(
          key: key,
          notifier: sliderData,
          child: child,
        );

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderNotifier>()
          ?.notifier
          ?.value ??
      0.0;
}
