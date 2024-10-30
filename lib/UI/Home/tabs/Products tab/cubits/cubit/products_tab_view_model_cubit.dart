import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_products_use_case.dart';
import 'package:equatable/equatable.dart';

part 'products_tab_view_model_state.dart';

class ProductsTabViewModelCubit extends Cubit<ProductsTabViewModelState> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductsTabViewModelCubit({required this.getAllProductsUseCase})
      : super(ProductsTabViewModelInitialState());

  void getAllProducts() async {
    emit(ProductsTabViewModelLoadingState());
    var response = await getAllProductsUseCase.invoke();
    response.fold((failure) {
      emit(ProductsTabViewModelFailureState(errorMessage: failure.errMessage!));
    }, (products) {
      emit(ProductsTabViewModelSuccessState(productsList: products));
    });
  }
}
