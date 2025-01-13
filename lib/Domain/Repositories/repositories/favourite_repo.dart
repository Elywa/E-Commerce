import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Model/response/add_cart_response_dto/add_product_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';

abstract class FavouriteRepo{
  Future<Either<FailuresEntity , AddProductToFavouriteResponseEntity>> addProductToFavourite(String productId) ; 
}