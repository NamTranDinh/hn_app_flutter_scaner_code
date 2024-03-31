import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:master_scanner_app/common/widgets/item_button.dart';
import 'package:master_scanner_app/common/widgets/item_text_input.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class GenerateEvent extends StatefulWidget {
  const GenerateEvent({super.key});

  @override
  _GenerateEventState createState() => _GenerateEventState();
}

class _GenerateEventState extends State<GenerateEvent> {

  TextEditingController name = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            width: size.width,
            height: size.height,
            child: Container(
              color: AppColor.grey,
              child: SvgPicture.asset(Assets.icons.iconBackground, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: SingleChildScrollView(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColor.grey.withAlpha(200),
                    borderRadius: BorderRadius.circular(6),
                    border: const Border(
                      top: BorderSide(color: AppColor.primaryYellow, width: 2.0),
                      bottom: BorderSide(color: AppColor.primaryYellow, width: 2.0),
                    ),
                    boxShadow: [BoxShadow(color: AppColor.pureBlack.withAlpha(125), blurRadius: 12)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 42, left: 24, right: 22),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.iconEvent,
                          colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                          width: 60,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        ItemTextInput(
                          label: 'event_generate.name_lb'.tr(),
                          controller: name,
                          hint: 'event_generate.name_ht'.tr(),
                          validate: (value) => null,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ItemTextInput(
                          label: 'event_generate.start_lb'.tr(),
                          controller: startDate,
                          hint: 'event_generate.start_ht'.tr(),
                          validate: (value) => null,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ItemTextInput(
                          label: 'event_generate.end_lb'.tr(),
                          controller: endDate,
                          hint: 'event_generate.end_ht'.tr(),
                          validate: (value) => null,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ItemTextInput(
                          label: 'event_generate.loca_lb'.tr(),
                          controller: location,
                          hint: 'event_generate.loca_ht'.tr(),
                          validate: (value) => null,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ItemTextInput(
                          label: 'event_generate.des_lb'.tr(),
                          controller: description,
                          hint: 'event_generate.des_hint'.tr(),
                          validate: (value) => null,
                          maxLine: 4,
                        ),
                        const SizedBox(
                          height: 49,
                        ),
                        ItemButton(
                          title: 'wifi_form.title'.tr(),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: ResultAppBar(
        title: 'generate.email'.tr(),
        action: () {
          Get.back();
        },
        icon: Assets.icons.iconBack,
      ),
    );
  }
}
