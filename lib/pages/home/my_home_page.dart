import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/blocs/navbar/navbar_cubit.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/di.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/generate/generate_page.dart';
import 'package:master_scanner_app/pages/history/history_page.dart';
import 'package:master_scanner_app/pages/home/widget/nav_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<NavbarCubit>(),
        child: Scaffold(
          // TODO(nam): add common appbar
          backgroundColor: AppColor.grey,
          body: BlocBuilder<NavbarCubit, ItemNavBar>(
            buildWhen: (previous, current) => previous.name != current.name,
            builder: (BuildContext context, state) => IndexedStack(
              index: ItemNavBar.values.indexOf(state),
              children: const [
                GeneratePage(),
                HistoryPage(),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryYellow[80]!.withOpacity(.8),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
            ),
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: SvgPicture.asset(Assets.icons.iconScan),
                ),
              ),
            ),
          ),
          bottomNavigationBar: const NavBar(),
        ),
      );
}
