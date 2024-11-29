
import 'package:danial_asadi/Features/Login/presentation/bloc/auth_bloc.dart';
import 'package:danial_asadi/Features/Login/presentation/bloc/auth_status.dart';
import 'package:danial_asadi/Features/Login/presentation/screens/complete_status_login_page.dart';
import 'package:danial_asadi/Features/Shop/presentation/screens/shop_page.dart';
import 'package:danial_asadi/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        locator(),
        locator(),
        locator(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus is AuthCompleted) {
                              FocusScope.of(context).unfocus();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const ShopPage();
                },
              ),
            );
          } else if (state.authStatus is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.blueAccent,
                content: Text('خطا',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ))));
          }
        },
        builder: (context, state) {
          if (state.authStatus is AuthCompleted) {
            return const CompleteStatusLoginPage();
          } else if (state.authStatus is AuthLoading) {
            return const Scaffold(
              backgroundColor: Colors.blueAccent,
              body: Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                  strokeWidth: 5,
                ),
              ),
            );
          } else {
           return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                  child: Text(
                'خطا',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontFamily: 'yekanbakh'),
              )),
            );
          }
        },
      ),
    );
  }
}





