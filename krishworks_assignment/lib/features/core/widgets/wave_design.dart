import 'package:flutter/rendering.dart';

class WaveDesign extends CustomClipper<Path> {

  const WaveDesign();

  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * (3 / 4));

    path.quadraticBezierTo(
      0,
      (size.height * (3 / 4)),
      size.width * (1 / 3) - size.width / 6,
      (size.height * (2.94 / 4)),
    );

    path.quadraticBezierTo(
      size.width * (2 / 3) + size.width / 6,
      (size.height * (2.58 / 4)),
      size.width,
      (size.height * (1.5 / 4)),
    );

    // path.quadraticBezierTo(
    //   0,
    //   (size.height * (3 / 4)),
    //   size.width * (1 / 3) - size.width / 6,
    //   (size.height * (2.9 / 4)),
    // );
    //
    // path.quadraticBezierTo(
    //   size.width * (2 / 3) + size.width / 6,
    //   (size.height * (2.5 / 4)),
    //   size.width,
    //   (size.height * (1 / 4)),
    // );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
