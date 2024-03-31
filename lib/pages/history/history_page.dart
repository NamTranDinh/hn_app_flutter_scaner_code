import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:master_scanner_app/common/widgets/appbar.dart';
import 'package:master_scanner_app/common/widgets/item_qr_history.dart';
import 'package:master_scanner_app/pages/generate/widget/non_glow_scrollable.dart';
import 'package:master_scanner_app/pages/history/widget/item_switch.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool type = false;
  final List<String> _list = ['1', '1', '1', '1'];

  @override
  Widget build(BuildContext context) {
    final appbar = 'history_page.bar'.tr();
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: appbar,
            action: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: CustomSwitch(
              value: type,
              onChanged: (v) {
                setState(() {
                  type = v;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 46),
              child: ScrollConfiguration(
                behavior: NonGlowScrollable(),
                child: ListView(
                  children: List.generate(
                    _list.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: ItemQrHistory(onDelete: () {}, data: 'data', type: 'data', date: 'data', onCopy: () {}),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
