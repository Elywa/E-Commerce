import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Model/response/products_response_dto/products_response_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/get_product_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/add_cart_product_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_tab_view_model_state.dart';

class ProductsTabViewModelCubit extends Cubit<ProductsTabViewModelState> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddCartProductUseCase addCartProductUseCase;
  List<GetProductEntity> productsList = [];
  int numOfCartItems = 0;
  ProductsTabViewModelCubit(
      {required this.getAllProductsUseCase,
      required this.addCartProductUseCase})
      : super(ProductsTabViewModelInitialState());

  static ProductsTabViewModelCubit get(context) {
    return BlocProvider.of(context);
  }

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
      debugPrint(
          "======================= Product Added Successfully and number is : $numOfCartItems ================");

      debugPrint(
          "======================= Product Added Successfully and number is : $numOfCartItems ================");

      emit(AddProductToCartSuccessState(
          addProductResponseEntity: successResponse));
    });
  }
}
