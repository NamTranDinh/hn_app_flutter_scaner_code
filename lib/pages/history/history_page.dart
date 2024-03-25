import 'package:master_scanner_app/material.dart';

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
              child: ListView(
                children: List.generate(
                  _list.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: ItemQrResult(onDelete: () {}, data: 'data', type: 'data', date: 'data', onCopy: () {}),
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
