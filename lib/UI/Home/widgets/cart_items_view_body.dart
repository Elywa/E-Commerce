import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/tabs/cart/cubit/cubit/get_cart_products_cubit.dart';
import 'package:e_commerce/UI/Home/widgets/cart_items_app_bar.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/checkout_box.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsViewBody extends StatelessWidget {
  CartItemsViewBody({super.key});
  GetCartProductsCubit viewModel =
      GetCartProductsCubit(injectGetCartProductsUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartProductsCubit, GetCartProductsState>(
      bloc: viewModel..getCartProducts(),
      builder: (context, state) {
        if (state is GetCartProductsSuccess) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.cartProducts.data!.products!.length,
                  itemBuilder: (context, index) {
                    return CartViewItem(
                      product: state.cartProducts.data!.products![index],
                    );
                  },
                ),
              ),
               CheckoutBox( totalPrice: state.cartProducts.data!.totalCartPrice,)
            ],
          );
        } else if (state is GetCartProductsFailure) {
          return Center(
            child: Text(
              state.error.errMessage!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
