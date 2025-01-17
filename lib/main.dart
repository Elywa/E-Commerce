import 'package:e_commerce/UI/Auth/Login/login_view.dart';
import 'package:e_commerce/UI/Auth/Register/register_view.dart';
import 'package:e_commerce/UI/Home/Home_View.dart';
import 'package:e_commerce/UI/Home/tabs/cart/cart_items_view.dart';
import 'package:e_commerce/UI/Home/product_details_view.dart';
import 'package:e_commerce/UI/Splash/splash_view.dart';
import 'package:e_commerce/UI/Utils/app_theme.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/my_bloc_observer.dart';
import 'package:e_commerce/UI/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // prepare everythimg before main if wanted.
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox('token');
  await MySharedPrefrence.init();
  // var user = MySharedPrefrence.getData(key: 'token');
  // String route;
  // if (user == null) {
  //   route = LoginView.loginViewId;
  // } else {
  //   route = HomeView.homeViewId;
  // }
  // debugPrint(
  //     '==================================== $route and token is : $user ================ ');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // String route;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashView.splashId,
          debugShowCheckedModeBanner: false,
          routes: {
            SplashView.splashId: (context) => const SplashView(),
            LoginView.loginViewId: (context) => const LoginView(),
            RegisterView.registerViewId: (context) => const RegisterView(),
            HomeView.homeViewId: (contex) => const HomeView(),
            ProductDetailsView.routeName: (context) =>
                const ProductDetailsView(),
            CartItemsView.routeName: (context) => const CartItemsView(),
          },
          theme: AppTheme.mainTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
