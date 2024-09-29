import 'package:e_commerce/UI/Auth/Login/login_view.dart';
import 'package:e_commerce/UI/Splash/splash_view.dart';
import 'package:e_commerce/UI/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
          },
          theme: AppTheme.mainTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
