import 'package:application/enums/search_type.dart';

abstract interface class SearchableController {
  SearchType? searchType;

  Future<void> onSearchTypeChanged();
}
