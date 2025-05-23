import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class InformationToast {
  void show(BuildContext context, String text) {
    final overlay = Overlay.of(context);
    late final OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => _NotificationWidget(
        text: text,
        onRemove: () => overlayEntry.remove(),
      ),
    );
    overlay.insert(overlayEntry);
  }
}

class _NotificationWidget extends StatefulWidget {
  const _NotificationWidget({
    required this.text,
    required this.onRemove,
  });

  final String text;
  final VoidCallback onRemove;

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _offsetAnimation = TweenSequence<Offset>(
      [
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(0, 2),
          ).chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)),
          weight: 50,
        ),
      ],
    ).animate(_controller);

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), widget.onRemove);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: Center(
                child: Text(
                  widget.text,
                  style: context.themeData.textTheme.headlineSmall
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: widget.onRemove,
            ),
          ),
        ),
      ),
    );
  }
}
