import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';

class CartItemImage extends StatelessWidget {
  CartItemImage({
    super.key,
    this.image,
  });
  String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .28,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(image ?? MyAssets.networkImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
