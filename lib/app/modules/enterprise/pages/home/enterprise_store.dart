import 'package:flutter/material.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/api_response.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/debouncer.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/repositories/enterprise_repository.dart';
import 'package:mobx/mobx.dart';

part 'enterprise_store.g.dart';

class EnterpriseStore = _EnterpriseBase with _$EnterpriseStore;

abstract class _EnterpriseBase with Store {
  final EnterpriseRepository repository;

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  String _searchText = "";

  @observable
  bool isLoading = false;

  @observable
  ObservableList<EnterpriseModel> searchResults =
      <EnterpriseModel>[].asObservable();

  final Debouncer onSearchDebouncer =
      new Debouncer(delay: new Duration(milliseconds: 1000));

  _EnterpriseBase(this.repository) {
    _initListeners();
    search();
  }

  @action
  _initListeners() {
    searchController.addListener(() {
      if (searchController.text != _searchText) {
        _searchText = searchController.text;
        onSearchDebouncer.debounce(
          () => search(),
        );
      }
    });
  }

  @action
  search() async {
    try {
      searchResults.clear();
      if (_searchText.isNotEmpty || _searchText != "") {
        isLoading = true;
        ApiResponse? response = await repository.search(_searchText);
        if (response != null) {
          searchResults.addAll(response.data as List<EnterpriseModel>);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }
}
