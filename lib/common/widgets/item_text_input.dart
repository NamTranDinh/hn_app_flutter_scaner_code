import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Column,
        InputDecoration,
        OutlineInputBorder,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextFormField,
        Widget;
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/core/app_text_style.dart';

class ItemTextInput extends StatefulWidget {
  const ItemTextInput({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.action,
    this.keyboard,
    this.validate,
  });

  final TextInputAction? action;
  final TextInputType? keyboard;
  final String label, hint;
  final String? Function(String?)? validate;
  final TextEditingController controller;

  @override
  _ItemTextInputState createState() => _ItemTextInputState();
}

class _ItemTextInputState extends State<ItemTextInput> {
  _ItemTextInputState();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 35),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.label,
                  style: AppTextStyle.footNote2.copyWith(color: AppColor.whiteLight),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 45),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.whiteLight.withAlpha((255 * 0.8).toInt())),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.whiteLight.withAlpha((255 * 0.8).toInt())),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.whiteLight.withAlpha((255 * 0.8).toInt())),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.whiteLight.withAlpha((255 * 0.8).toInt())),
                  ),
                  hintStyle: AppTextStyle.caption2.copyWith(color: AppColor.whiteLight.withAlpha((255 * 0.34).toInt())),
                  fillColor: AppColor.lightGrey2.withAlpha((255 * 0.78).toInt()),
                  filled: true,
                ),
                style: AppTextStyle.caption2.copyWith(color: AppColor.whiteLight),
                textAlign: TextAlign.start,
                textInputAction: widget.action ?? TextInputAction.done,
                keyboardType: widget.keyboard ?? TextInputType.text,
                validator: widget.validate,
              ),
            ),
          ],
        ),
      );
}
