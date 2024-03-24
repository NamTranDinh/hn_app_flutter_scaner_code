import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/common/widgets/item_scan_input.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/scanner/widget/scan_view_blur_background.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  double _currentSliderValue = 1.0;
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Builder(
          builder: (context) {
            final size = MediaQuery.of(context).size;
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CameraScanView(
                    frame: Size(343, 349),
                  ),
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: ItemScanInput(choseImage: () {}, flash: () {}, changeCamera: () {}),
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.icons.iconScanFrame,
                    width: 343,
                    height: 349,
                  ),
                  Positioned(
                    bottom: 60,
                    width: 300,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_currentSliderValue > 0) _currentSliderValue--;
                            });
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              // Màu nền của splash
                              borderRadius: BorderRadius.circular(8), // Bo tròn viền splash
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.minus,
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _currentSliderValue,
                            min: 1.0,
                            max: 10.0,
                            divisions: 9,
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },

                            // activeColor: AppColor.primaryYellow,
                            inactiveColor: AppColor.grey,
                            thumbColor: AppColor.primaryYellow,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_currentSliderValue < 10) _currentSliderValue++;
                            });
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), // Bo tròn viền splash
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.plus,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
