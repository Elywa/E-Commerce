import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Model/response/products_response_dto/products_response_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_product_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/product_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/add_cart_product_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_products_use_case.dart';
import 'package:equatable/equatable.dart';

part 'products_tab_view_model_state.dart';

class ProductsTabViewModelCubit extends Cubit<ProductsTabViewModelState> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddCartProductUseCase addCartProductUseCase;
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;
  ProductsTabViewModelCubit(
      {required this.getAllProductsUseCase,
      required this.addCartProductUseCase})
      : super(ProductsTabViewModelInitialState());

  void getAllProducts() async {
    emit(ProductsTabViewModelLoadingState());
    var response = await getAllProductsUseCase.invoke();
    response.fold((failure) {
      emit(ProductsTabViewModelFailureState(errorMessage: failure));
    }, (products) {
      productsList = products.data ?? [];
      emit(ProductsTabViewModelSuccessState(productsResponseEntity: products));
    });
  }

  void addProductToCart({required String productId}) async {
    emit(AddProductToCartLoadingState());
    var response = await addCartProductUseCase.invoke(productId);
    response.fold((failure) {
      emit(AddProductToCartFailureState(errorMessage: failure));
    }, (successResponse) {
      numOfCartItems = successResponse.numOfCartItems!.toInt();
      emit(AddProductToCartSuccessState(
          addProductResponseEntity: successResponse));
    });
  }
}
