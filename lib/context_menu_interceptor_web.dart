import 'package:flutter/widgets.dart';
import 'dart:html' as html;

class Interceptor extends StatelessWidget {
  final Widget child;

  const Interceptor({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Disable default browser context menu
    html.document.onContextMenu.listen((event) => event.preventDefault());

    return child;
  }
}
