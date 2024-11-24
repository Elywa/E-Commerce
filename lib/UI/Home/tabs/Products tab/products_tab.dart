import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/product_details_view.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/cubits/cubit/products_tab_view_model_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTabView extends StatefulWidget {
  ProductsTabView({super.key});

  @override
  State<ProductsTabView> createState() => _ProductsTabViewState();
}

class _ProductsTabViewState extends State<ProductsTabView> {
  ProductsTabViewModelCubit viewModel = ProductsTabViewModelCubit(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addCartProductUseCase: injectAddCartProductUseCase());
  @override
  // void initState() {
  //    viewModel.getAllProducts();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocProvider<ProductsTabViewModelCubit>(
          create: (context) =>viewModel..getAllProducts(),
          child:
              BlocBuilder<ProductsTabViewModelCubit, ProductsTabViewModelState>(
            
            builder: (context, state) {
              if (state is ProductsTabViewModelLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsTabViewModelFailureState) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      state.errorMessage.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                );
              } else if (state is ProductsTabViewModelSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      const Image(
                        image: AssetImage(MyAssets.routeImage),
                      ),
                      const SizedBox(
                        height: 17.5,
                      ),
                      const SearchRow(),
                      SizedBox(
                        height: 24.h,
                      ),
                      GridView.builder(
                        itemCount: viewModel.productsList.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductDetailsView.routeName,
                                  arguments: viewModel.productsList[index]);
                            },
                            child: ProductItem(
                              imagePath:
                                  viewModel.productsList[index].images?[0],
                              description:
                                  viewModel.productsList[index].description,
                              price: viewModel.productsList[index].price,
                              rate:
                                  viewModel.productsList[index].ratingsAverage,
                              title: viewModel.productsList[index].title,
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          // crossAxisSpacing: 16,
                          childAspectRatio: 2.3 / 3,
                          // mainAxisSpacing: 16,
                          crossAxisCount: 2,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
