import 'package:artacode_test/Features/Login/presentation/screens/register_page.dart';
import 'package:artacode_test/Features/Shop/presentation/screens/shop_page.dart';
import 'package:artacode_test/Features/SplashScreen/presentation/screens/splash_screen_page.dart';
import 'package:artacode_test/cores/config/theme.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // navigatorKey: Constants.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'First Method', 
          theme: MyThemes.lightTheme(fontFamily: 'yekanbakh'), 
          home: const SplashScreenPage(),
          builder: (context, child) {
            return Theme(
              data: MyThemes.lightTheme(fontFamily: 'yekanbakh'), 
              child: child!,
            );
          },
        );
      },
    );
  }
  }
