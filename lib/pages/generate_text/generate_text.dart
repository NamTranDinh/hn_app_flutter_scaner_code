import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/common/widgets/single_input_form.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';

import '../../blocs/genarate/generate_page_cubit.dart';

class GenerateSingleInputPage extends StatefulWidget {
  const GenerateSingleInputPage({
    super.key,
    required this.appBarLabel,
    required this.inputLabel,
    required this.inputHint,
    required this.onClick,
    required this.iconPath,
  });
  final String appBarLabel, inputLabel, inputHint, iconPath;
  final Function(String data) onClick;

  @override
  _GenerateSingleInputPageState createState() => _GenerateSingleInputPageState();
}

class _GenerateSingleInputPageState extends State<GenerateSingleInputPage> {
  _GenerateSingleInputPageState();

  void back() {
    context.read<GeneratePageCubit>().go(ItemGeneratePage.root);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          width: size.width,
          height: size.height,
          child: SvgPicture.asset(
            Assets.icons.iconBackground,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          height: 80,
          width: size.width,
          child: ResultAppBar(
            title: widget.appBarLabel,
            action: back,
            icon: Assets.icons.iconBack,
          ),
        ),
        Positioned(
          width: 335,
          height: 336,
          child: SingerInputForm(
            iconPath: widget.iconPath,
            label: widget.inputLabel,
            validate: (v) => null,
            hint: widget.inputHint,
            controller: TextEditingController(),
            onClick: (data) {
              widget.onClick(data);
            },
          ),
        )
      ],
    );
  }
}
