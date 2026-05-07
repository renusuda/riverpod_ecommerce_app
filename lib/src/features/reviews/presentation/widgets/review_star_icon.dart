import 'package:flutter/material.dart';

class ReviewStarIcon extends StatelessWidget {
  const ReviewStarIcon({
    super.key,
    required this.fillRatio,
    this.size = 28,
    this.color = const Color(0xFFFFC107),
    this.emptyColor = const Color(0xFF9C98A0),
  });

  final double fillRatio;
  final double size;
  final Color color;
  final Color emptyColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Stack(
        children: [
          Icon(Icons.star, color: emptyColor, size: size),
          ClipRect(
            clipper: _HorizontalRatioClipper(fillRatio),
            child: Icon(Icons.star, color: color, size: size),
          ),
        ],
      ),
    );
  }
}

class _HorizontalRatioClipper extends CustomClipper<Rect> {
  const _HorizontalRatioClipper(this.ratio);

  final double ratio;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * ratio, size.height);
  }

  @override
  bool shouldReclip(_HorizontalRatioClipper oldClipper) {
    return ratio != oldClipper.ratio;
  }
}
