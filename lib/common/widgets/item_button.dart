import 'package:flutter/material.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/core/app_text_style.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({super.key, required this.title, required this.onTap, this.flex});

  final String title;
  final double? flex;
  final Function onTap;
  Widget btn() => ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size.fromHeight(46)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          shadowColor: MaterialStateProperty.all(AppColor.primaryBlack.withAlpha((255 * 0.5).toInt())),
          elevation: MaterialStateProperty.all(21),
        ),
        child: Text(
          title,
          style: AppTextStyle.body2.copyWith(
            color: AppColor.grey,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) => btn();
}
