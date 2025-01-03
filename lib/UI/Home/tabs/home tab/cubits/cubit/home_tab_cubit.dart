import 'package:bloc/bloc.dart';
import 'package:e_commerce/Data/Model/response/category_or_brands_response_dto/category_or_brands_response_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_categories_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_brands_use_case.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:equatable/equatable.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({required this.categoriesUseCase, required this.brandsUseCase})
      : super(HomeTabInitialState());
  GetAllCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  // handle logic   - hold data
  List<CategoryOrBrandsEntity> categoriesList = [];
  List<CategoryOrBrandsEntity> brandsList = [];

  void getAllCategories() async {
    emit(HomeTabLoadingState());

    var response = await categoriesUseCase.invoke();
    return response.fold((failure) {
      emit(HomeTabFailureState(error: failure));
    }, (categories) {
      categoriesList = categories.data ?? [];
      emit(HomeTabSuccessState(cateories: categories));
    });
  }

  void getAllBrands() async {
    emit(BrandsLoadingState());

    var response = await brandsUseCase.invoke();
    return response.fold((failure) {
      emit(BrandsFailureState(error: failure));
    }, (brands) {
      brandsList = brands.data ?? [];
      emit(BrandsSuccessState(brands: brands));
    });
  }
}
