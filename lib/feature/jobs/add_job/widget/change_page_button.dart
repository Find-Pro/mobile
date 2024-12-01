import 'package:flutter/material.dart';

class ChangePageButton extends StatelessWidget {
  const ChangePageButton({
    required this.icon,
    required this.left,
    required this.right,
    required this.onTap,
    required this.heroTag,
    super.key,
  });
  final IconData icon;
  final String heroTag;
  final double? left;
  final double? right;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: left,
      right: right,
      child: FloatingActionButton(
        onPressed: onTap,
        heroTag: heroTag,
        backgroundColor: Colors.grey.shade700,
        mini: true,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
