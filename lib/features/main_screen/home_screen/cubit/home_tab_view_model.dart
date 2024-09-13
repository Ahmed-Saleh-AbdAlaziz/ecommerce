import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/use_cases/home_brands_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/home_category_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/product_use_case.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  HomeCategoryUseCase categoryUseCase;
  HomeBrandsUseCase brandsUseCase;

  HomeTabViewModel({
    required this.categoryUseCase,
    required this.brandsUseCase,
  }) : super(HomeTabInitState());
  List<CategoryDataEntity>? categoryList;
  List<BrandsDataEntity>? brandsList;
  List<ProductDataEntity>? productList;

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getCategoryDate() async {
    emit(HomeTabLoadingState());
    var either = await categoryUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(failures: l));
    }, (r) {
      //r=>response
      categoryList = r.data ?? [];
      if (categoryList!.isNotEmpty) {
        emit(HomeTabSuccessState(responseEntity: r));
      }
    });
  }

  void getBrandsData() async {
    emit(HomeTabLoadingBrandsState());
    var either = await brandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorBrandsState(failures: l));
    }, (r) {
      brandsList = r.data ?? [];
      if (brandsList!.isNotEmpty) {
        emit(HomeTabSuccessBrandsState(responseEntity: r));
      }
    });
  }
}
