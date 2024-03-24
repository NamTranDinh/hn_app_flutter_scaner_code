import 'package:flutter/material.dart';
import 'package:qr_code_scanner/core/app_color.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  CustomShapeClipper({super.reclip, required this.ignorSize});

  final Size ignorSize;

  @override
  Path getClip(Size size) {
    final p = Path();
    final w = size.width, h = size.height;
    final cx = w / 2, cy = h / 2;
    final p1 = Offset(cx - ignorSize.width / 2, cy - ignorSize.height / 2),
        p2 = Offset(cx + ignorSize.width / 2, cy - ignorSize.height / 2);
    final p3 = Offset(cx - ignorSize.width / 2, cy + ignorSize.height / 2),
        p4 = Offset(cx + ignorSize.width / 2, cy + ignorSize.height / 2);

    p
      ..moveTo(0, 0)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(w, 0)
      ..lineTo(0, 0)
      ..moveTo(p2.dx, p2.dy)
      ..lineTo(p4.dx, p4.dy)
      ..lineTo(w, h)
      ..lineTo(w, 0)
      ..moveTo(p3.dx, p3.dy)
      ..lineTo(p4.dx, p4.dy)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..moveTo(p3.dx, p3.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(0, 0)
      ..lineTo(0, h)
      ..close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CameraScanView extends StatelessWidget {
  const CameraScanView({super.key, required this.frame});

  final Size frame;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: CustomShapeClipper(ignorSize: frame),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
