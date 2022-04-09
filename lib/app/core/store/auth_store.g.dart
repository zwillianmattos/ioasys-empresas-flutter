// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<dynamic>? _$investorComputed;

  @override
  dynamic get investor =>
      (_$investorComputed ??= Computed<dynamic>(() => super.investor,
              name: '_AuthStoreBase.investor'))
          .value;

  final _$investorModelAtom = Atom(name: '_AuthStoreBase.investorModel');

  @override
  InvestorModel? get investorModel {
    _$investorModelAtom.reportRead();
    return super.investorModel;
  }

  @override
  set investorModel(InvestorModel? value) {
    _$investorModelAtom.reportWrite(value, super.investorModel, () {
      super.investorModel = value;
    });
  }

  final _$headersAtom = Atom(name: '_AuthStoreBase.headers');

  @override
  dynamic get headers {
    _$headersAtom.reportRead();
    return super.headers;
  }

  @override
  set headers(dynamic value) {
    _$headersAtom.reportWrite(value, super.headers, () {
      super.headers = value;
    });
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void storeUser(InvestorModel investorModel, dynamic headers) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.storeUser');
    try {
      return super.storeUser(investorModel, headers);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStore() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.clearStore');
    try {
      return super.clearStore();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
investorModel: ${investorModel},
headers: ${headers},
investor: ${investor}
    ''';
  }
}
