import 'package:qr_code_scanner/flavors.dart';

import 'package:qr_code_scanner/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.staging;
  await runner.main();
}
