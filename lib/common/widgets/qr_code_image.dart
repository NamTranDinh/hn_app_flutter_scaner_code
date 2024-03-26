import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeImage extends StatelessWidget {
  const QrCodeImage({super.key, required this.data, this.size});

  final String data;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final qrCode = QrCode(2, QrErrorCorrectLevel.L)..addData(data);
    final qrImage = QrImage(qrCode);
    return CustomPaint(
      size: size ?? const Size(250, 250),
      painter: _QRCodePainter(qrImage),
    );
  }
}

class _QRCodePainter extends CustomPainter {
  _QRCodePainter(this.qrImage);

  final QrImage qrImage;

  @override
  void paint(Canvas canvas, Size size) {
    final squareSize = size.width / qrImage.moduleCount;
    for (var x = 0; x < qrImage.moduleCount; x++) {
      for (var y = 0; y < qrImage.moduleCount; y++) {
        if (qrImage.isDark(y, x)) {
          final rect = Rect.fromPoints(
            Offset(x * squareSize, y * squareSize),
            Offset((x + 1) * squareSize, (y + 1) * squareSize),
          );
          final paint = Paint()
            ..color = Colors.black
            ..style = PaintingStyle.fill;
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
