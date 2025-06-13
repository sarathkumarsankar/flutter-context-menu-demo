import 'package:contextmenu/context_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxSize = constraints.biggest.shortestSide / 4;
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: constraints.maxWidth / 6,
                top: constraints.maxHeight / 6,
                child: ContextMenu(
                  child: RectangleArea(
                    label: 'Top left',
                    color: Colors.yellow,
                    size: boxSize,
                  ),
                ),
              ),
              Positioned(
                right: constraints.maxWidth / 6,
                top: constraints.maxHeight / 6,
                child: ContextMenu(
                  child: RectangleArea(
                    label: 'Top right',
                    color: Colors.green,
                    size: boxSize,
                  ),
                ),
              ),
              Positioned(
                right: constraints.maxWidth / 6,
                bottom: constraints.maxHeight / 6,
                child: ContextMenu(
                  child: RectangleArea(
                    label: 'Bottom right',
                    color: Colors.blue,
                    size: boxSize,
                  ),
                ),
              ),
              Positioned(
                left: constraints.maxWidth / 6,
                bottom: constraints.maxHeight / 6,
                child: ContextMenu(
                  child: RectangleArea(
                    label: 'Bottom left',
                    color: Colors.purple,
                    size: boxSize,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// [Container] with the provided [label], [size] and [color].
class RectangleArea extends StatelessWidget {
  const RectangleArea({
    super.key,
    required this.label,
    required this.size,
    required this.color,
  });

  /// Text to display in the center of this widget.
  final String label;

  /// Color to display the [Container] with.
  final Color color;

  /// Size of the [Container].
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color),
      child: Center(child: Text(label)),
    );
  }
}
