import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_scanner_app/blocs/navbar/navbar_cubit.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/home/widget/nav_item.dart';

class NavModel {
  NavModel({required this.page, required this.navKey});

  final Widget page;
  final GlobalKey<NavigatorState> navKey;
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 13,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: Platform.isAndroid ? 16 : 0),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              children: [
                BlocBuilder<NavbarCubit, ItemNavBar>(
                  buildWhen: (previous, current) => previous.name != current.name,
                  builder: (context, state) => NavItem(
                    onTap: () => context.read<NavbarCubit>().go(page: ItemNavBar.generatePage),
                    isSelected: state == ItemNavBar.generatePage,
                    svgIconPath: Assets.icons.iconQrcode,
                    title: 'home_page.nav_bar.generate'.tr(),
                  ),
                ),
                const SizedBox(width: 70),
                BlocBuilder<NavbarCubit, ItemNavBar>(
                  buildWhen: (previous, current) => previous.name != current.name,
                  builder: (context, state) => NavItem(
                    onTap: () => context.read<NavbarCubit>().go(page: ItemNavBar.historyPage),
                    isSelected: state == ItemNavBar.historyPage,
                    svgIconPath: Assets.icons.iconHistory,
                    title: 'home_page.nav_bar.history'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
