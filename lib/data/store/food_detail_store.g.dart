// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodPageStore on FoodPageStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: 'FoodPageStoreBase.isLoading',
  )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: 'FoodPageStoreBase.hasError',
  )).value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess => (_$isSuccessComputed ??= Computed<bool>(
    () => super.isSuccess,
    name: 'FoodPageStoreBase.isSuccess',
  )).value;

  late final _$foodInfoAtom = Atom(
    name: 'FoodPageStoreBase.foodInfo',
    context: context,
  );

  @override
  ObservableFuture<FoodModel?> get foodInfo {
    _$foodInfoAtom.reportRead();
    return super.foodInfo;
  }

  @override
  set foodInfo(ObservableFuture<FoodModel?> value) {
    _$foodInfoAtom.reportWrite(value, super.foodInfo, () {
      super.foodInfo = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: 'FoodPageStoreBase.errorMessage',
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

  late final _$featchFoodInfoAsyncAction = AsyncAction(
    'FoodPageStoreBase.featchFoodInfo',
    context: context,
  );

  @override
  Future<void> featchFoodInfo(int id) {
    return _$featchFoodInfoAsyncAction.run(() => super.featchFoodInfo(id));
  }

  @override
  String toString() {
    return '''
foodInfo: ${foodInfo},
errorMessage: ${errorMessage},
isLoading: ${isLoading},
hasError: ${hasError},
isSuccess: ${isSuccess}
    ''';
  }
}
