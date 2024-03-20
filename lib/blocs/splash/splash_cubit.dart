import 'package:base_core/base_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<BaseCubitState<dynamic>> {
  SplashCubit() : super(BaseCubitState.init());

  Future<void> init() async {
    emit(state.copyWith(status: Status.loading));
    await Future<void>.delayed(const Duration(seconds: 1));
    // Do anything
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: Status.success));
  }
}
