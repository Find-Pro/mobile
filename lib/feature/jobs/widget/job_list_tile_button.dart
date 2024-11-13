import 'package:flutter/material.dart';

class JobListTileButton extends StatelessWidget {
  const JobListTileButton({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        minimumSize: const Size(25, 25),
      ),
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: Colors.white,
        size: 17,
      ),
    );
  }
}
