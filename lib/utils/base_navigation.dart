import 'package:flutter/material.dart';

class BaseNavigation {
  BaseNavigation._();
  static void push(BuildContext context,
      {required String routeName, Object? arguments, bool clearStack = false}) {
    if (clearStack) {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (r) => false,
          arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }

  static void pop(context) {
    Navigator.pop(context);
  }

  static T getArgs<T>(BuildContext context, {required String key}) {
    return (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)[key] as T;
  }
}
