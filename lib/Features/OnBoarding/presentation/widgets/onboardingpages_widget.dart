import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
    // Image.network('',fit: BoxFit.cover,),
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              width: 250.w,
              height: 250.w,
              'assets/images/MainIMG.png',
              
              fit: BoxFit.cover,
            ),
          ),
        ),
     SizedBox(height: 75.h ,),
        Text('فروشگاه ما', style: theme.textTheme.titleLarge!.copyWith(color:      const Color(0XFF2D64CF),),
         
        ),
         SizedBox(
          height: 6.h,
        ),
        Text('همه چیز در فروشگاه ما پیدا میشه',style: theme.textTheme.titleMedium),
      ],
    );
  }
}
