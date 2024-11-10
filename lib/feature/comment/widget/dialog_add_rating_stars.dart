import 'package:flutter/material.dart';

class DialogAddRatingStars extends StatefulWidget {
  const DialogAddRatingStars({required this.onRatingChanged, super.key});
  final void Function(int) onRatingChanged;

  @override
  DialogAddRatingStarsWidgetState createState() =>
      DialogAddRatingStarsWidgetState();
}

class DialogAddRatingStarsWidgetState extends State<DialogAddRatingStars> {
  int _rating = 1;

  void _onStarTapped(int starIndex) {
    setState(() {
      _rating = starIndex;
    });
    widget.onRatingChanged(_rating);
  }

  @override
  Widget build(BuildContext context) {
    final stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      stars.add(
        GestureDetector(
          onTap: () => _onStarTapped(i),
          child: Icon(
            i <= _rating ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 40,
          ),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
