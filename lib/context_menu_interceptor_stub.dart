import 'package:flutter/widgets.dart';

class Interceptor extends StatelessWidget {
  final Widget child;

  const Interceptor({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child; // No special handling on native platforms
  }
}
