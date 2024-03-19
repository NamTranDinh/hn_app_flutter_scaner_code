import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemQr extends StatelessWidget {
  const ItemQr({super.key, required this.iconSrc, required this.textValue, required this.onTap});

  final double width = 86;
  final double height = 92;
  final String iconSrc;
  final String textValue;
  final Function onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 10,
              width: 86,
              height: 82,
              child: DecoratedBox(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xff333333)),
                child: SvgPicture.asset(
                  iconSrc,
                  width: 40,
                  height: 29,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              width: 57,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: const Color(0xffd9d9d9), borderRadius: BorderRadius.circular(4)),
              child: Text(
                textValue,
                style: const TextStyle(color: Color(0xff2D3047), fontSize: 12),
              ),
            )
          ],
        ),
      );
}
