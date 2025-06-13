// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:html' as html; // Only for Web

// class Interceptor extends StatelessWidget {
//   final Widget child;

//   const Interceptor({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context, dynamic html) {
//     if (kIsWeb) {
//       // Disable browser context menu on Web
//       html.document.onContextMenu.listen((event) => event.preventDefault());
//     }

//     return Listener(
//       onPointerDown: (_) {}, // Ensures this widget captures pointer events
//       child: child,
//     );
//   }
// }
