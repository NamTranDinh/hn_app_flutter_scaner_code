import 'package:base_core/base_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:master_scanner_app/blocs/qr_code/qr_code_cubit.dart';
import 'package:master_scanner_app/common/widgets/appbar_scanner_qr.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/di.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/routes/routes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key, this.onReceiver}) : super(key: key);
  final Function(dynamic data)? onReceiver;

  @override
  State<StatefulWidget> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerPage> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _isFlashOff = ValueNotifier<bool>(true);

  @override
  void reassemble() {
    super.reassemble();
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<QrCodeCubit>(),
        child: Scaffold(
          body: Stack(
            children: [
              BlocBuilder<QrCodeCubit, QrCodeState>(
                builder: (context, state) => _buildQrView(context),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: ValueListenableBuilder(
                    valueListenable: _isFlashOff,
                    builder: (context, value, child) => AppbarScannerQr(
                      // TODO(nam): handle case pick image from gallery
                      onTapImage: () {},
                      onTapFlash: () async {
                        await controller?.toggleFlash();
                        _isFlashOff.value = !(await controller?.getFlashStatus() ?? true);
                      },
                      isShowShadow: false,
                      onChangeCamera: () => controller?.flipCamera(),
                      isFlashOff: _isFlashOff.value,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: (context.heightDevice - 250) / 2 + 89),
                  child: Text(
                    'qr_code_scanner_page.title'.tr(),
                    style: AppTextStyle.footNote2.copyWith(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller?.dispose();
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: context.widthDevice * 9 / 10,
                    height: 48,
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                    alignment: Alignment.center,
                    child: Text(
                      'qr_code_scanner_page.cancel_btn'.tr(),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildQrView(BuildContext context) {
    const scanArea = 250.0;
    return BlocListener<QrCodeCubit, QrCodeState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          controller?.dispose();
          Get.offNamed(Routes.resultPage, arguments: state.data);
        }
      },
      child: QRView(
        key: qrKey,
        onQRViewCreated: (controller) => _onQRViewCreated(controller, context),
        overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 5,
          cutOutSize: scanArea,
        ),
        onPermissionSet: _onPermissionSet,
      ),
    );
  }

  void _onPermissionSet(QRViewController ctrl, bool p) {}

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      context.read<QrCodeCubit>().scan(data: QrCodeResultModel(data: scanData.code));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
