import 'dart:io';

import 'package:artacode_test/Features/Login/data/data_source/local/login_secure_storage.dart';
import 'package:artacode_test/Features/Login/data/data_source/remote/login_api_provider.dart';
import 'package:artacode_test/Features/Login/data/repository/login_repository_impl.dart';
import 'package:artacode_test/Features/Login/domain/repository/login_repository.dart';
import 'package:artacode_test/Features/Login/domain/usecases/insert_auth_token_usecase.dart';
import 'package:artacode_test/Features/Login/domain/usecases/login_api_usecase.dart';
import 'package:artacode_test/Features/Login/domain/usecases/register_api_usecase.dart';
import 'package:artacode_test/Features/Login/presentation/bloc/auth_bloc.dart';
import 'package:artacode_test/Features/OnBoarding/data/data_source/local/onboarding_secure_storage.dart';
import 'package:artacode_test/Features/OnBoarding/data/repository/onboarding_repository_impl.dart';
import 'package:artacode_test/Features/OnBoarding/domain/repository/onboarding_repository.dart';
import 'package:artacode_test/Features/OnBoarding/domain/usecases/insert_database_onboarding_usecase.dart';
import 'package:artacode_test/Features/Shop/data/data_source/local/Shop_secure_storage.dart';
import 'package:artacode_test/Features/Shop/data/repository/Shop_repository_impl.dart';
import 'package:artacode_test/Features/Shop/domain/repository/Shop_repository.dart';
import 'package:artacode_test/Features/Shop/domain/usecases/delete_database_Shop.dart';
import 'package:artacode_test/Features/SplashScreen/data/data_source/local/splash_screen_secure_storage.dart';
import 'package:artacode_test/Features/SplashScreen/data/repository/splash_screen_repository_impl.dart';
import 'package:artacode_test/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:artacode_test/Features/SplashScreen/domain/usecases/read_token_splash_screen_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class Storage {
  static final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage(
      aOptions: Platform.isAndroid
          ? _getAndroidOptions()
          : AndroidOptions.defaultOptions,
      iOptions: Platform.isIOS ? _getIOSOptions() : IOSOptions.defaultOptions);

  static _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static _getIOSOptions() => (accessibility: KeychainAccessibility.unlocked);
}

GetIt locator = GetIt.I;

setUp() {
  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<FlutterSecureStorage>(Storage.flutterSecureStorage);

// splash screen

  locator
      .registerSingleton<SplashScreenDatabase>(SplashScreenDatabase(locator()));

  locator.registerSingleton<SplashScreenRepository>(
      SplashScreenRepositoryImpl(locator()));

  locator.registerSingleton<ReadTokenSplashScreenDatabaseUsecase>(
      ReadTokenSplashScreenDatabaseUsecase.ReadTokenSplashScreenDatabaseUsecase(
          locator()));

// onboarding

  locator.registerSingleton<OnBoardingDatabase>(OnBoardingDatabase(locator()));

  locator.registerSingleton<OnBoardingRepositoryImpl>(
      OnBoardingRepositoryImpl(locator()));

  locator.registerSingleton<OnBoardingRepository>(
      OnBoardingRepositoryImpl(locator()));

  locator.registerSingleton<InsertOnBoardingDatabaseUsecase>(
      InsertOnBoardingDatabaseUsecase(locator()));

// shop

  locator.registerSingleton<ShopDatabase>(ShopDatabase(locator()));

  locator.registerSingleton<ShopRepository>(ShopRepositoryImpl(locator()));

  locator.registerSingleton<DeleteShopDatabaseUsecase>(
      DeleteShopDatabaseUsecase(locator()));



//  login


  locator.registerSingleton<LoginDatabase>(LoginDatabase(locator()));


  locator.registerSingleton<LoginApiProvider>(LoginApiProvider(locator()));


  locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator(),
  locator()
  
  ));


  locator.registerSingleton<InsertAuthTokenUsecase>(
      InsertAuthTokenUsecase(locator()));

  locator.registerSingleton<LoginApiUsecase>(LoginApiUsecase(locator()));


  locator.registerSingleton<RegisterApiUsecase>(RegisterApiUsecase(locator()));


  locator.registerSingleton<AuthBloc>(AuthBloc(
    
    locator(),
    locator(),
    locator(),
  
  ));



}
