// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: 'HomeStoreBase.isLoading',
  )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: 'HomeStoreBase.hasError',
  )).value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess => (_$isSuccessComputed ??= Computed<bool>(
    () => super.isSuccess,
    name: 'HomeStoreBase.isSuccess',
  )).value;

  late final _$homeInfoAtom = Atom(
    name: 'HomeStoreBase.homeInfo',
    context: context,
  );

  @override
  ObservableFuture<HomeModel?> get homeInfo {
    _$homeInfoAtom.reportRead();
    return super.homeInfo;
  }

  @override
  set homeInfo(ObservableFuture<HomeModel?> value) {
    _$homeInfoAtom.reportWrite(value, super.homeInfo, () {
      super.homeInfo = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: 'HomeStoreBase.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$featchHomeInfoAsyncAction = AsyncAction(
    'HomeStoreBase.featchHomeInfo',
    context: context,
  );

  @override
  Future<void> featchHomeInfo() {
    return _$featchHomeInfoAsyncAction.run(() => super.featchHomeInfo());
  }

  @override
  String toString() {
    return '''
homeInfo: ${homeInfo},
errorMessage: ${errorMessage},
isLoading: ${isLoading},
hasError: ${hasError},
isSuccess: ${isSuccess}
    ''';
  }
}
