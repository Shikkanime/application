import 'package:application/data/models/enums/search_type.dart';

abstract interface class SearchableController {
  SearchType? searchType;

  Future<void> onSearchTypeChanged();
}
