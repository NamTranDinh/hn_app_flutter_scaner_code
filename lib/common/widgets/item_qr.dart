import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_scanner_app/core/app_color.dart';

class ItemQr extends StatefulWidget {
  const ItemQr({super.key, required this.iconSrc, required this.textValue, required this.onTap});

  final String iconSrc;
  final String textValue;
  final Function() onTap;

  @override
  State<ItemQr> createState() => _ItemQrState();
}

class _ItemQrState extends State<ItemQr> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Size?> _animScale;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animScale = SizeTween(end: const Size(1.1, 1.1), begin: const Size(1, 1)).animate(_animController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) => _animController.forward(),
        onTapUp: (details) => _animController.reverse(),
        onTapCancel: () => _animController.reverse(),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: AnimatedBuilder(
            animation: _animScale,
            builder: (context, child) => Transform.scale(
              scale: _animScale.value?.width,
              child: Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.grey,
                      boxShadow: [
                        BoxShadow(color: AppColor.pureBlack.withAlpha(144), blurRadius: 12),
                      ],
                    ),
                    child: Center(
                      child: Hero(
                        tag: 'anim-icon-${widget.iconSrc}',
                        child: SvgPicture.asset(
                          widget.iconSrc,
                          width: 34,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.color),
                        ),
                      ),
                    ),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, value, child) => Positioned(
                      bottom: -(21 / (value * 2)),
                      child: Opacity(opacity: value, child: child),
                    ),
                    child: Container(
                      height: 21,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColor.whiteLight, borderRadius: BorderRadius.circular(4)),
                      child: Hero(
                        tag: 'anim-title-${widget.textValue}',
                        child: Text(
                          widget.textValue,
                          style: const TextStyle(color: AppColor.naviBlue, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }
}
