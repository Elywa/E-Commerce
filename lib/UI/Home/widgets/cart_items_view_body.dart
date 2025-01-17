import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';
import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/tabs/cart/cubit/cubit/cart_products_cubit.dart';
import 'package:e_commerce/UI/Home/widgets/cart_items_app_bar.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/checkout_box.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsViewBody extends StatefulWidget {
  CartItemsViewBody({super.key});

  @override
  State<CartItemsViewBody> createState() => _CartItemsViewBodyState();
}

class _CartItemsViewBodyState extends State<CartItemsViewBody> {
  CartProductsCubit viewModel = CartProductsCubit(
      injectGetCartProductsUseCase(),
      injectDeleteCartProductUseCase(),
      injectUpdateCartProductUseCase());

  int itemCount = 0;

  List<GetProductCartEntity> products = [];

  int? totalPrice = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartProductsCubit>(
      create: (context) => viewModel..getCartProducts(),
      child: BlocConsumer<CartProductsCubit, CartProductsState>(
        listener: (context, state) {
          if (state is DeleteCartProductFailure) {
            showErrorSnackBar(context, "Failed to delete product. Try again.");
          } else if (state is GetCartProductsSuccess) {
            // Update state on successful fetch
            setState(() {
              itemCount = state.cartProducts.data?.products?.length ?? 0;
              products = state.cartProducts.data?.products ?? [];
              totalPrice = state.cartProducts.data?.totalCartPrice;
            });
          } else if (state is DeleteCartProductSuccess) {
            // Update state immediately after deletion
            setState(() {
              itemCount = viewModel.cartItems.length;
              products = viewModel.cartItems;
              totalPrice = state.cartProducts.data?.totalCartPrice ?? 0;
            });
          }

          if (state is DeleteCartProductSuccess) {
            showErrorSnackBar(context, "Deleted successfully", verical: 110);
          }
        },
        builder: (context, state) {
          if (state is GetCartProductsSuccess ||
              state is DeleteCartProductSuccess ||
              state is DeleteCartProductFailure ||
              state is DeleteCartProductLoading ||
              state is UpdateCartProductSuccess ||
              state is UpdateCartProductFailure ||
              state is UpdateCartProductLoading) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return CartViewItem(
                        product:
                            CartProductsCubit.get(context).cartItems[index],
                      );
                    },
                  ),
                ),
                CheckoutBox(
                  totalPrice: totalPrice,
                ),
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
      ),
    );
  }
}
