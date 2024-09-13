import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/use_cases/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsScreenViewModel extends Cubit<ProductScreenState> {
  ProductUseCase productUseCase;
  List<ProductDataEntity> productList = [];

  ProductsScreenViewModel({required this.productUseCase})
      : super(ProductScreenInitState());

  getPrdouctsData() async {
    var either = await productUseCase.invoke();
    either.fold((l) {
      emit(ProductScreenErrorState(failures: l));
    }, (r) {
      productList = r.data!;
      emit(ProductScreenSuccessState(responseEntity: r));
    });
  }
}
