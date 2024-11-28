import 'package:artacode_test/Features/Login/presentation/bloc/auth_bloc.dart';
import 'package:artacode_test/Features/Login/presentation/bloc/auth_status.dart';
import 'package:artacode_test/Features/Login/presentation/screens/complete_status_register_page.dart';
import 'package:artacode_test/Features/Login/presentation/screens/login_page.dart';
import 'package:artacode_test/Features/Shop/presentation/screens/shop_page.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        locator(),
        locator(),
        locator(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus is AuthCompleted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const ShopPage();
                },
              ),
            );
          } else   if (state.authStatus is AuthError) {


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
            return const CompleteStatusRegisterPage();
          } else if (state.authStatus is AuthLoading) {
         
            return const Scaffold(

backgroundColor:  Colors.blueAccent,

              body: Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                  strokeWidth: 5,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
