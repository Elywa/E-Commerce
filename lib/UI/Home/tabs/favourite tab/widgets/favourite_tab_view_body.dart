import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/widgets/favourite_item.dart';
import 'package:e_commerce/UI/Home/widgets/cart_view_Item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:flutter/material.dart';

class FavouriteTabViewBody extends StatelessWidget {
  const FavouriteTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const FavouriteItemView();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
