import 'package:application/models/lang_type.dart';
import 'package:material_ui/material_ui.dart';

abstract interface class LangTypeFilterViewModel extends Listenable {
  bool isLangTypeSelected(LangType langType);

  Future<void> onChanged(LangType langType);
}
