// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  Computed<bool>? _$isLoadingFormComputed;

  @override
  bool get isLoadingForm =>
      (_$isLoadingFormComputed ??= Computed<bool>(() => super.isLoadingForm,
              name: '_SignInStoreBase.isLoadingForm'))
          .value;

  final _$signInModelAtom = Atom(name: '_SignInStoreBase.signInModel');

  @override
  SignInModel get signInModel {
    _$signInModelAtom.reportRead();
    return super.signInModel;
  }

  @override
  set signInModel(SignInModel value) {
    _$signInModelAtom.reportWrite(value, super.signInModel, () {
      super.signInModel = value;
    });
  }

  final _$errorsAtom = Atom(name: '_SignInStoreBase.errors');

  @override
  ObservableList<String> get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(ObservableList<String> value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SignInStoreBase.isLoading');

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

  @override
  String toString() {
    return '''
signInModel: ${signInModel},
errors: ${errors},
isLoading: ${isLoading},
isLoadingForm: ${isLoadingForm}
    ''';
  }
}
