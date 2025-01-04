import 'package:e_commerce/UI/Home/widgets/cart_items_app_bar.dart';
import 'package:e_commerce/UI/Home/widgets/cart_items_view_body.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartItemsView extends StatelessWidget {
  const CartItemsView({super.key});
  static String routeName = 'CartItemsView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildCartItemsViewAppBar(context),
      body: const CartItemsViewBody(),
    ));
  }
}
