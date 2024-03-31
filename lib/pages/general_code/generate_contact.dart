import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:master_scanner_app/common/widgets/item_button.dart';
import 'package:master_scanner_app/common/widgets/item_text_input.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/generate/widget/non_glow_scrollable.dart';

class GenerateContact extends StatefulWidget {
  const GenerateContact({super.key});

  @override
  State<GenerateContact> createState() => _GenerateContactState();
}

class _GenerateContactState extends State<GenerateContact> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
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
          SafeArea(
            child: ScrollConfiguration(
              behavior: NonGlowScrollable(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(46),
                  child: Container(
                    // constraints: const BoxConstraints(maxHeight: 747),
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
                            Assets.icons.iconContact,
                            colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ItemTextInput(
                                  label: 'contact.fn_lb'.tr(),
                                  controller: firstName,
                                  hint: 'contact.n_ht'.tr(),
                                  validate: (value) => null,
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Expanded(
                                child: ItemTextInput(
                                  label: 'contact.name_lb'.tr(),
                                  controller: lastName,
                                  hint: 'contact.n_ht'.tr(),
                                  validate: (value) => null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.comp_lb'.tr(),
                            controller: company,
                            hint: 'contact.comp_ht'.tr(),
                            validate: (value) => null,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.job_lb'.tr(),
                            controller: job,
                            hint: 'contact.job_ht'.tr(),
                            validate: (value) => null,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.phone_lb'.tr(),
                            controller: phone,
                            hint: 'contact.phone_ht'.tr(),
                            validate: (value) => null,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.email_lb'.tr(),
                            controller: email,
                            hint: 'contact.email_ht'.tr(),
                            validate: (value) => null,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.web_lb'.tr(),
                            controller: website,
                            hint: 'contact.web_ht'.tr(),
                            validate: (value) => null,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ItemTextInput(
                            label: 'contact.address_lb'.tr(),
                            controller: address,
                            hint: 'contact.address_ht'.tr(),
                            validate: (value) => null,
                            maxLine: 3,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ItemTextInput(
                                  label: 'contact.city_lb'.tr(),
                                  controller: city,
                                  hint: 'contact.city_ht'.tr(),
                                  validate: (value) => null,
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Expanded(
                                child: ItemTextInput(
                                  label: 'contact.country_lb'.tr(),
                                  controller: country,
                                  hint: 'contact.country_ht'.tr(),
                                  validate: (value) => null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 31,
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
          )
        ],
      ),
      appBar: ResultAppBar(
        title: 'generate.contact'.tr(),
        action: () {
          Get.back();
        },
        icon: Assets.icons.iconBack,
      ),
    );
  }
}
