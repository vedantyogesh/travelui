import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var FEP = Offset(size.width * .5, size.height - 30.0);
    var FCP = Offset(size.width * 0.25, size.height - 45.0);
    path.quadraticBezierTo(FCP.dx, FCP.dy, FEP.dx, FEP.dy);

    var SEP = Offset(size.width, size.height - 80.0);
    var SCP = Offset(size.width * .84, size.height - 10.0);
    path.quadraticBezierTo(SCP.dx, SCP.dy, SEP.dx, SEP.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
