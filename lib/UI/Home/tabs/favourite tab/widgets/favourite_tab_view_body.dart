import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/cubit/favourite_tab_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/widgets/favourite_item.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteTabViewBody extends StatelessWidget {
  FavouriteTabViewBody({super.key});
  FavouriteTabCubit viewModel =
      FavouriteTabCubit(injectGetUserWishListProductsUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteTabCubit, FavouriteTabState>(
      bloc: viewModel..getUserWishListProducts(),
      builder: (context, state) {
        if (state is FavouriteTabSuccessState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SearchRow(),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.getUserWishListProductsResponseEntity.data!.length,
                      itemBuilder: (context, index) {
                        return  FavouriteItemView(product: state.getUserWishListProductsResponseEntity.data![index],);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is FavouriteTabFailureState) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
