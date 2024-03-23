import 'package:flutter_bloc/flutter_bloc.dart';

enum ItemGeneratePage {
  root,
  text,
  website,
  wifi,
  event,
  contact,
  business,
  location,
  whatapp,
  email,
  twitter,
  instagram
}

class GeneratePageCubit extends Cubit<ItemGeneratePage> {
  GeneratePageCubit() : super(ItemGeneratePage.root);
  void go(ItemGeneratePage next) => emit(next);
}
