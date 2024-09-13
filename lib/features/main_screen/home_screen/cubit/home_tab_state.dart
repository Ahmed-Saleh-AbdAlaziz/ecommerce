import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class HomeTabState {}

class HomeTabInitState extends HomeTabState {}

class HomeTabLoadingState extends HomeTabState {}

class HomeTabErrorState extends HomeTabState {
  Failures failures;

  HomeTabErrorState({required this.failures});
}

class HomeTabSuccessState extends HomeTabState {
  ///Category
  CategoryResponseEntity responseEntity;

  HomeTabSuccessState({required this.responseEntity});
}

class HomeTabSuccessBrandsState extends HomeTabState {
  BrandsResponseEntity responseEntity;

  HomeTabSuccessBrandsState({required this.responseEntity});
}

class HomeTabLoadingBrandsState extends HomeTabState {}

class HomeTabErrorBrandsState extends HomeTabState {
  Failures failures;

  HomeTabErrorBrandsState({required this.failures});
}
