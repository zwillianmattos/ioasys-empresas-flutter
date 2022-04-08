// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterpriseStore on _EnterpriseBase, Store {
  final _$searchControllerAtom = Atom(name: '_EnterpriseBase.searchController');

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  final _$_searchTextAtom = Atom(name: '_EnterpriseBase._searchText');

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EnterpriseBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$searchResultsAtom = Atom(name: '_EnterpriseBase.searchResults');

  @override
  ObservableList<EnterpriseModel> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<EnterpriseModel> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_EnterpriseBase.search');

  @override
  Future search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  final _$_EnterpriseBaseActionController =
      ActionController(name: '_EnterpriseBase');

  @override
  dynamic _initListeners() {
    final _$actionInfo = _$_EnterpriseBaseActionController.startAction(
        name: '_EnterpriseBase._initListeners');
    try {
      return super._initListeners();
    } finally {
      _$_EnterpriseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
isLoading: ${isLoading},
searchResults: ${searchResults}
    ''';
  }
}
