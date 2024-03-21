import 'package:flutter_bloc/flutter_bloc.dart';

enum ItemNavBar { generatePage, historyPage, scanQRPage }

class NavbarCubit extends Cubit<ItemNavBar> {
  NavbarCubit() : super(ItemNavBar.generatePage);

  void go({required ItemNavBar page}) => emit(page);
}
