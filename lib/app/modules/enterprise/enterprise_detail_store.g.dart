// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterpriseDetailStore on _EnterpriseDetailBase, Store {
  final _$isLoadingAtom = Atom(name: '_EnterpriseDetailBase.isLoading');

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

  final _$enterpriseAtom = Atom(name: '_EnterpriseDetailBase.enterprise');

  @override
  EnterpriseModel? get enterprise {
    _$enterpriseAtom.reportRead();
    return super.enterprise;
  }

  @override
  set enterprise(EnterpriseModel? value) {
    _$enterpriseAtom.reportWrite(value, super.enterprise, () {
      super.enterprise = value;
    });
  }

  final _$detailsAsyncAction = AsyncAction('_EnterpriseDetailBase.details');

  @override
  Future details() {
    return _$detailsAsyncAction.run(() => super.details());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
enterprise: ${enterprise}
    ''';
  }
}
