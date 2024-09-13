import 'package:ecommerce_app/core/theme/myAppTheme.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/login_screen.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di.dart';
import 'features/auth_presentations_screens/register_screen/register_screen.dart';
import 'features/splash_screen/splash_screen.dart';
import 'features/main_screen/main_screen.dart';
import 'features/products_details_screen/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesUtils.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeTabViewModel>(
        create: (context) => getIt<HomeTabViewModel>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          MainScreen.routeName: (context) => MainScreen()
        },
        initialRoute: SplashScreen.routeName,
        theme: MyAppTheme.appTheme,
      ),
    );
  }
}
