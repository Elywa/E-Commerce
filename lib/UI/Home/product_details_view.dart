import 'package:e_commerce/UI/Home/widgets/product_details_view_appbar.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const String routeName = 'Product Details View';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
