import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:equatable/equatable.dart';

part 'favourite_tab_state.dart';

class FavouriteTabCubit extends Cubit<FavouriteTabState> {
  FavouriteTabCubit() : super(FavouriteTabInitial());
}
