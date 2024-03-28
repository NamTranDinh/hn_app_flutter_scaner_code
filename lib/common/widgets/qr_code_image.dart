import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeImage extends StatelessWidget {
  const QrCodeImage({super.key, required this.data, this.size});

  final String data;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final levelQr = calculateLevelQr(countBitsOfString(data));
    const errorLevelQr = QrErrorCorrectLevel.Q;
    final qrCode = QrCode(levelQr, errorLevelQr)..addData(data);
    final qrImage = QrImage(qrCode);
    return CustomPaint(
      size: size ?? const Size(250, 250),
      painter: _QRCodePainter(qrImage),
    );
  }

  int countBitsOfString(String input) {
    int totalBits = 0;
    for (int i = 0; i < input.length; i++) {
      final int unicode = input.codeUnitAt(i);
      totalBits += unicode.toRadixString(2).length;
    }
    return totalBits;
  }

  int calculateLevelQr(int totalBits) {
    final List<int> sequence = [880, 1752, 2952, 3672];

    int result = 8;
    for (int i = 0; i < sequence.length; i++) {
      if (sequence[i] < totalBits) {
        result = (i + 1) * 10 + 5;
      } else {
        break;
      }
    }

    return result < 40 ? result : 40;
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
