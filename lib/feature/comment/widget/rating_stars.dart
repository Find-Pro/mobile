part of 'comment_card.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({required this.rating, super.key});
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? Colors.amber : Colors.grey,
          size: 25,
        );
      }),
    );
  }
}
