import 'package:artacode_test/Features/Login/presentation/bloc/auth_bloc.dart';
import 'package:artacode_test/Features/Login/presentation/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteStatusLoginPage extends StatelessWidget {
  const CompleteStatusLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0XFFe0e6ff),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 100.h,
                ),
              ),
              Center(
                child: Image.asset(
                  width: 310.w,
                  'assets/images/LoginIMG.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 300.w,
                child: Form(
                  key: formKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ایمیل',
                          style: TextStyle(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'yekanbakh'),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'yekanbakh'),
                          decoration: InputDecoration(
                            hintText: 'info@example.com',
                            hintStyle: const TextStyle(fontSize: 12),
                            hintTextDirection: TextDirection.rtl,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً ایمیل خود را وارد کنید.';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'ایمیل وارد شده معتبر نیست.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'رمز عبور',
                          style: TextStyle(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'yekanbakh'),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'yekanbakh'),
                          decoration: InputDecoration(
                            hintText: 'رمز عبور حداقل ۵ کاراکتر',
                            hintStyle: const TextStyle(fontSize: 13),
                            hintTextDirection: TextDirection.rtl,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً رمز عبور خود را وارد کنید.';
                            } else if (value.length < 5) {
                              return 'رمز عبور باید حداقل ۵ کاراکتر باشد.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 125.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300.w, 45.h),
                  maximumSize: Size(300.w, 45.h),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 50.w, vertical: 10.h),
                  elevation: 0,
                  backgroundColor: const Color(0XFF0183FF),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<AuthBloc>().add(LoginEvent(
                        email: textController1.text,
                        pass: textController2.text));
                  }
                },
                child: Text(
                  'ورود',
                  style: TextStyle(
                      fontFamily: 'yekanbakh',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  Navigator.of(context).pushReplacement(
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      color: const Color(0XFF8A8A8A)),
                ),
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
