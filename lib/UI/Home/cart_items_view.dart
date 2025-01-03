import 'package:e_commerce/UI/Home/widgets/cart_items_view_body.dart';
import 'package:flutter/material.dart';

class CartItemsView extends StatelessWidget {
  const CartItemsView({super.key});
  static String routeName = 'CartItemsView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: CartItemsViewBody(),
    ));
  }
}
