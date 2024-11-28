import 'package:artacode_test/Features/Login/presentation/screens/start_page.dart';
import 'package:artacode_test/Features/OnBoarding/domain/usecases/insert_database_onboarding_usecase.dart';
import 'package:artacode_test/Features/OnBoarding/presentation/widgets/onboardingpages_widget.dart';
import 'package:artacode_test/cores/params/onboarding_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  setOnboardingFalse() async {
    InsertOnBoardingDatabaseUsecase readSplashScreenDatabaseUsecase =
        locator.get();

    DataState dataState = await readSplashScreenDatabaseUsecase(
        param: OnBoardingUsecaseParams(key: 'onboarding', value: true));

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

  bool isLastPage = false;

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    pageController.addListener(
      () {
        if (pageController.page?.round() == 2) {
          setState(() {
            isLastPage = true;
          });
        } else {
          setState(() {
            isLastPage = false;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 500.w,
              height: 650.h,
              child: PageView(
                controller: pageController,
                children: const [
                  OnBoardingPages(),
                  OnBoardingPages(),
                  OnBoardingPages(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (isLastPage) {
                  if (await setOnboardingFalse()) {
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
                } else {
                  pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 350,
                      ),
                      curve: Curves.linear);
                }
              },
              child: Container(
                width: 96.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: themeData.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: isLastPage
                    ? Center(
                        child: Text('پایان',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    )),
                      )
                    : const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(dotHeight: 8.h, dotWidth: 8.w),
              onDotClicked: (index) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.linear);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
