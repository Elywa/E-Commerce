import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_tab_view_model_state.dart';

class ProductsTabViewModelCubit extends Cubit<ProductsTabViewModelState> {
  ProductsTabViewModelCubit() : super(ProductsTabViewModelInitialState());
}
