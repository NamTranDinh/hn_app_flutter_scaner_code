import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeImage extends StatelessWidget {
  const QrCodeImage({super.key, required this.data, this.size});

  final String data;
  final Size? size;

  @override
  Widget build(BuildContext context) => QrImageView(
        data: data,
        version: QrVersions.auto,
        size: size?.width,
        gapless: true,
        backgroundColor: Color(const Color(0x00000000).value),
        errorCorrectionLevel: QrErrorCorrectLevel.L,
        semanticsLabel: 'qr code',
      );
}
