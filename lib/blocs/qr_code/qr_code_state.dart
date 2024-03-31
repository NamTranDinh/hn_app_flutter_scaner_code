part of 'qr_code_cubit.dart';

class QrCodeState extends Equatable {
  const QrCodeState({
    this.data,
    this.status,
    this.errorMessage,
  });

  factory QrCodeState.init() => const QrCodeState(status: base_core.Status.init);

  final QrCodeResultModel? data;
  final String? errorMessage;
  final base_core.Status? status;

  QrCodeState copyWith({
    QrCodeResultModel? data,
    base_core.Status? status,
    String? errorMessage,
  }) =>
      QrCodeState(
        data: data ?? this.data,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [data, status, errorMessage];
}
