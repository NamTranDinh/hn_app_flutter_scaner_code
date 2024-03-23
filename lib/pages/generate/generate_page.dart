import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/blocs/genarate/generate_page_cubit.dart';
import 'package:qr_code_scanner/common/widgets/appbar.dart';
import 'package:qr_code_scanner/common/widgets/item_qr.dart';
import 'package:qr_code_scanner/di.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/generate_text/generate_text.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({super.key});
  void backToHome(BuildContext context) => context.read<GeneratePageCubit>().go(ItemGeneratePage.root);
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (ctx) => getIt<GeneratePageCubit>(),
        child: BlocBuilder<GeneratePageCubit, ItemGeneratePage>(
          buildWhen: (oldState, newState) => oldState.name != newState.name,
          builder: (BuildContext context, ItemGeneratePage state) {
            switch (state) {
              case ItemGeneratePage.root:
                return _rootView(context);
              case ItemGeneratePage.text:
                return GenerateSingleInputPage(
                  iconPath: Assets.icons.iconText,
                  appBarLabel: 'generate.text'.tr(),
                  inputLabel: 'generate.text'.tr(),
                  inputHint: 'generate.text_hint'.tr(),
                  onClick: (data) {},
                );
              case ItemGeneratePage.email:
                return GenerateSingleInputPage(
                  iconPath: Assets.icons.iconEmail,
                  appBarLabel: 'generate.email'.tr(),
                  inputLabel: 'generate.email'.tr(),
                  inputHint: 'generate.email_hint'.tr(),
                  onClick: (data) {},
                );
              default:
                return Container();
            }
          },
        ),
      );

  Widget _rootView(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(title: 'generate.appbar_title'.tr(), action: () {}),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 21, right: 21),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                padding: EdgeInsets.only(left: 21, right: 21),
                children: [
                  ItemQr(
                    iconSrc: Assets.icons.iconText,
                    textValue: 'generate.text'.tr(),
                    onTap: () {
                      context.read<GeneratePageCubit>().go(ItemGeneratePage.text);
                    },
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconEmail,
                    textValue: 'generate.email'.tr(),
                    onTap: () {
                      context.read<GeneratePageCubit>().go(ItemGeneratePage.email);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
