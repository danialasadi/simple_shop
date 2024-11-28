import 'package:artacode_test/Features/Login/presentation/screens/start_page.dart';
import 'package:artacode_test/Features/Shop/domain/usecases/delete_database_Shop.dart';
import 'package:artacode_test/cores/params/shop_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({super.key, required this.assetNamne});

  final String assetNamne;

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  deleteToken() async {
    DeleteShopDatabaseUsecase deleteShopDatabaseUsecase = locator.get();

    DataState dataState =
        await deleteShopDatabaseUsecase(param: ShopUsecaseParams(key: 'token'));

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

  int? selectedColorIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe1e8ea),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.5.h, vertical: 5.h),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 1.5,
                              blurRadius: 17,
                              offset: Offset(0, 4),
                              color: Color.fromARGB(170, 58, 144, 255),
                            )
                          ],
                          color: const Color(0XFF0183FF),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        'دسته بازی',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'yekanbakh',
                            fontSize: 17.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'دسته بازی مخصوص XBOX',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'yekanbakh',
                          fontSize: 27.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'تومان',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontFamily: 'yekanbakh',
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '500,000',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                            fontFamily: 'yekanbakh',
                            fontSize: 25.sp),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textDirection: TextDirection.rtl,
                  children: [
                    ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.70, // نصف عرض تصویر
                        heightFactor: 1.0, // کل ارتفاع تصویر
                        child: Image.asset(
                          'assets/images/${widget.assetNamne}',
                          fit: BoxFit.cover,
                          width: 300.w,
                          height: 300.h,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: 18.r,
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color(0XFF0183FF),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(134, 1, 132, 255),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ]),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color.fromARGB(255, 255, 255, 255),
                           ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          size: 18.r,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'توضیحات',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'yekanbakh',
                          fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 53, 53, 53),
                              fontFamily: 'yekanbakh',
                              fontSize: 14.sp),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Color(0XFFe1e8ea),
                              Color.fromARGB(115, 225, 232, 234),
                            ])),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Text(
                            '+بیشتر',
                            style: TextStyle(
                                color: Color(0XFF0183FF),
                                fontSize: 13.sp,
                                fontFamily: 'yekanbakh'),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                  ),
                  child: SizedBox(
                    height: 30.h,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'انتخاب رنگ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'yekanbakh',
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 75.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = 0;
                            });
                          },
                          child: AnimatedContainer(
                            width: selectedColorIndex == 0 ? 30.w : 20.w,
                            height: selectedColorIndex == 0 ? 30.w : 20.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.25,
                                ),
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(100.r)),
                            duration: const Duration(milliseconds: 250),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = 1;
                            });
                          },
                          child: AnimatedContainer(
                            width: selectedColorIndex == 1 ? 30.w : 20.w,
                            height: selectedColorIndex == 1 ? 30.w : 20.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.25,
                                ),
                                color: const Color(0XFFFFD707),
                                borderRadius: BorderRadius.circular(100.r)),
                            duration: const Duration(milliseconds: 250),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = 2;
                            });
                          },
                          child: AnimatedContainer(
                            width: selectedColorIndex == 2 ? 30.w : 20.w,
                            height: selectedColorIndex == 2 ? 30.w : 20.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.25,
                                ),
                                color: const Color(0XFF0183FF),
                                borderRadius: BorderRadius.circular(100.r)),
                            duration: const Duration(milliseconds: 250),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = 3;
                            });
                          },
                          child: AnimatedContainer(
                            width: selectedColorIndex == 3 ? 30.w : 20.w,
                            height: selectedColorIndex == 3 ? 30.w : 20.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.25,
                                ),
                                color: const Color(0XFFFFFFFF),
                                borderRadius: BorderRadius.circular(100.r)),
                            duration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300.w, 45.h),
                    maximumSize: Size(300.w, 45.h),
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 40.w, vertical: 10.h),
                    elevation: 0,
                    backgroundColor: const Color(0XFF0183FF),
                  ),
                  onPressed: () {},
                  child: Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                        fontFamily: 'yekanbakh',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
            Positioned(
              top: 25.h,
              left: 0.w,
              child: ElevatedButton(
                onPressed: () async {
                  if (await deleteToken()) {
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const StartPage();
                          },
                        ),
                      );
                    }
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.blueAccent,
                          content: Text('خطا',
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ))));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFB9D1D7),
                    foregroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r)),
                    ),
                    elevation: 0),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout, size: 16),
                    SizedBox(width: 8),
                    Text(
                      "خروج",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'yekanbakh',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
