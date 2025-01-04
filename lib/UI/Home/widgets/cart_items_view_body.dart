import 'package:e_commerce/UI/Home/widgets/cart_items_app_bar.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/checkout_box.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartItemsViewBody extends StatelessWidget {
  const CartItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const CartViewItem();
            },
          ),
        ),
        const CheckoutBox()
      ],
    );
  }
}
