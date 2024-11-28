import 'package:artacode_test/Features/Login/presentation/screens/start_page.dart';
import 'package:artacode_test/Features/Shop/domain/usecases/delete_database_Shop.dart';
import 'package:artacode_test/Features/Shop/presentation/screens/single_product_page.dart';
import 'package:artacode_test/cores/params/shop_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    deleteToken() async {
      DeleteShopDatabaseUsecase deleteShopDatabaseUsecase = locator.get();

      print('ooooooooooooooo');

      DataState dataState = await deleteShopDatabaseUsecase(
          param: ShopUsecaseParams(key: 'token'));


      print('pppppppppppp');





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

    List itemsPicture = [
      'Controller.png',
      'Mobile.png',
      'SmartWatch.png',
      'TV.png',
      'SmartWatch.png',
      'Controller.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0XFFe1e8ea),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
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
                  'فروشگاه',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(5.r),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15.h, crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SingleProductPage(
                                  assetNamne: itemsPicture[index],
                                );
                              },
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(7.5.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              margin: EdgeInsets.only(top: 50.h),
                              width: 150.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'دسته بازی XBOX',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'yekanbakh',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  const Text('500,000'),
                                  Text(
                                    'تومان',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'yekanbakh',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              width: 100.w,
                              'assets/images/${itemsPicture[index]}',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
                    backgroundColor: Color(0XFFB9D1D7),
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
