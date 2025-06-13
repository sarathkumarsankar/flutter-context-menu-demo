import 'package:flutter/material.dart';
import 'context_menu_interceptor.dart'; // Conditional import

class ContextMenu extends StatefulWidget {
  final Widget child;

  const ContextMenu({Key? key, required this.child}) : super(key: key);

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  OverlayEntry? _overlayEntry;

  void _showMenu(BuildContext context, Offset position) {
    _removeMenu();

    final screenSize = MediaQuery.of(context).size;
    const menuWidth = 160.0;
    const menuHeight = 120.0;

    // Ensure the menu doesn't overflow screen bounds
    double dx = position.dx;
    double dy = position.dy;

    if (dx + menuWidth > screenSize.width) {
      dx = screenSize.width - menuWidth - 8;
    }

    if (dy + menuHeight > screenSize.height) {
      dy = screenSize.height - menuHeight - 8;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Detect taps outside menu to close
          GestureDetector(
            onTap: _removeMenu,
            behavior: HitTestBehavior.translucent,
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            left: dx,
            top: dy,
            child: Material(
              elevation: 8,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: menuWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: ['Create', 'Edit', 'Remove'].map((item) {
                    return ListTile(
                      dense: true,
                      title: Text(item, style: const TextStyle(fontSize: 14)),
                      onTap: _removeMenu,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true)?.insert(_overlayEntry!);
  }

  void _removeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Interceptor(
      child: GestureDetector(
        onSecondaryTapDown: (details) {
          _showMenu(context, details.globalPosition); // Right-click
        },
        onLongPressStart: (details) {
          _showMenu(context, details.globalPosition); // Long-press (mobile)
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _removeMenu();
    super.dispose();
  }
}
