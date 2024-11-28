import 'dart:async';

import 'package:artacode_test/Features/Login/presentation/screens/start_page.dart';
import 'package:artacode_test/Features/OnBoarding/presentation/screens/onboarding_page.dart';
import 'package:artacode_test/Features/Shop/presentation/screens/shop_page.dart';
import 'package:artacode_test/Features/SplashScreen/domain/usecases/read_token_splash_screen_usecase.dart';
import 'package:artacode_test/cores/params/login_usecase_params.dart';
import 'package:artacode_test/cores/params/splash_screen_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    validateToken() async {
      ReadTokenSplashScreenDatabaseUsecase readSplashScreenDatabaseUsecase =
          locator.get();

      DataState dataState = await readSplashScreenDatabaseUsecase(
          param: SplashScreenUsecaseParams(key: 'token'));

      if (dataState is DataSuccess) {
        if (dataState.data == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }


    entryCheck() async {
      ReadTokenSplashScreenDatabaseUsecase readSplashScreenDatabaseUsecase =
          locator.get();

      DataState dataState = await readSplashScreenDatabaseUsecase(
          param: SplashScreenUsecaseParams(key: 'onboarding'));

      if (dataState is DataSuccess) {
        if (dataState.data == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }


    Timer(
      const Duration(seconds: 5),
      () async {
        if (await validateToken()) {
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const ShopPage();
                },
              ),
            );
          }
        } else {


          if(await entryCheck()){

            if (context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const StartPage();
                  },
                ),
              );
            }

          }else{
                if (context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const OnBoardingPage();
                  },
                ),
              );
            }
          }
     
        }
      },
    );

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
              fit: BoxFit.cover,
              width: 130.w,
              height: 130.h,
            ),
          ),
          const Spacer(),
          const CupertinoActivityIndicator(
            color: Colors.blue,
            radius: 17,
          ),
          SizedBox(
            height: 25.h,
          )
        ],
      )),
    );
  }
}
