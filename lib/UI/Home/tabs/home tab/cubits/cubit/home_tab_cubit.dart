import 'package:bloc/bloc.dart';
import 'package:e_commerce/Data/Model/response/category_response_dto/category_response_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_entity.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_categories_use_case.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:equatable/equatable.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({required this.categoriesUseCase})
      : super(HomeTabInitialState());
  GetAllCategoriesUseCase categoriesUseCase;
  // handle logic   - hold data
  List<CategoryEntity> categoriesList = [];

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
}
