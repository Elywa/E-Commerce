import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/cubit/favourite_tab_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/widgets/favourite_item.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FavouriteTabViewBody extends StatelessWidget {
  FavouriteTabViewBody({super.key});
  FavouriteTabCubit viewModel = FavouriteTabCubit(
      injectGetUserWishListProductsUseCase(),
      injectRemoveFavouriteProductUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouriteTabCubit>(
        create: (context) => viewModel..getUserWishListProducts(),
        child: BlocConsumer<FavouriteTabCubit, FavouriteTabState>(
          listener: (context, state) {
            if (state is DeleteFavouriteProductFailure) {
              showErrorSnackBar(context, "oops!, Try again later");
            }
          },
          builder: (context, state) {
            if (state is FavouriteTabSuccessState ||
                state is DeleteFavouriteProductFailure ||
                state is DeleteFavouriteProductSuccess ||
                state is DeleteFavouriteProductLoading) {
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
                          itemCount: viewModel.favouriteList.length,
                          itemBuilder: (context, index) {
                            return FavouriteItemView(
                              product: viewModel.favouriteList[index],
                            );
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
        ));
  }
}
