import 'package:artacode_test/Features/Login/presentation/screens/login_page.dart';
import 'package:artacode_test/Features/Login/presentation/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {


ThemeData  theme = Theme.of(context);


    return  Scaffold(
      backgroundColor:  const Color(0XFFdce2ff),


body:

 SafeArea(
  child: Column(
  
  mainAxisAlignment: MainAxisAlignment.start,
  
    children: [
  
  Center(
    child: Image.asset(
                  width: double.infinity.w,
                  'assets/images/MainIMG.png',
                  fit: BoxFit.cover,
                ),
  ),
  
  
  Center(
              child: Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.cover,
                width: 100.w,
                height: 100.h,
              ),
            ),
  
  
  
  
  
  
  
  Text(
  'فروشگاه گیمینو',
              style: TextStyle(
                  fontFamily: 'yekanbakh',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
  
  
  SizedBox(height: 10.h,),
  
  SizedBox(
    width: 300.w,
    child: Text(
    'فروشگاه تخصصی لوازم بازی های رایانه ای و کنسول بازی',
    textWidthBasis: TextWidthBasis.parent,
    textDirection: TextDirection.rtl ,
    textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'yekanbakh',
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
  ),
  
  
  
  
  
  Spacer(),
  
  
  
  
  
  ElevatedButton(
    
    style: ElevatedButton.styleFrom(
      
      minimumSize:Size(325.w, 55.h),
      maximumSize: Size(325.w, 55.h),
  padding: EdgeInsetsDirectional.symmetric(horizontal: 50.w,vertical: 12.h),
      elevation: 0,
  backgroundColor: Color(0XFF0183FF),
  
    ),
    
  
  
  
  
  
    onPressed: () {
      Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ),
                );
  },
  
  
   child: Text(
  
  'ایجاد حساب کاربری',
                style: TextStyle(
                                  fontFamily: 'yekanbakh',
  
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
  
                    color:  Colors.white),
              ),
            
            ),
  
  TextButton(
    
    
    
    onPressed: () {
     Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
  }, child:  Text(
                'قبلا ثبت نام کرده ام',
                style: TextStyle(
                  fontFamily: 'yekanbakh',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: const Color(0XFF8A8A8A)),
              )
              ,
  
  
  
  ),
  SizedBox(height: 15.h,)
    ],
  ),
),


    );
  }
}