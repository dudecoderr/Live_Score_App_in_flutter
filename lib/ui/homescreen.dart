import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livescoreapp/constant/color.dart';
import 'package:livescoreapp/ui/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List ballImg = [ball1, ball2, ball3, ball4];
  List date = [
    "01 OCT",
    "02 OCT",
    "03 OCT",
    "04 OCT",
    "05 OCT",
    "06 OCT",
    "07 OCT",
    "08 OCT",
    "09 OCT",
    "10 OCT",
  ];
  List ballHeight = [10.h, 8.h, 13.h, 6.h];
  int selected = 0;
  int dateSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4b6578),
              Color(0xff5c7080),
              Color(0xff7a8690),
              Color(0xff8f9596),
              Color(0xff989a9c),
              Color(0xffbdb5af),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      color: kSkyBlueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.r),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.menu,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 288.w,
                    color: Colors.transparent,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: ballImg.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            height: 50.h,
                            width: 72.w,
                            decoration: BoxDecoration(
                              color: selected == index
                                  ? kWhiteColor
                                  : kSkyBlueColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100.r),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(ballHeight[index]),
                                child: Image.asset(
                                  ballImg[index],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                height: 30.h,
                width: double.infinity,
                color: Colors.transparent,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: date.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              dateSelected = index;
                            });
                          },
                          child: Text(
                            date[index],
                            style: TextStyle(
                                color: dateSelected == index
                                    ? kWhiteColor
                                    : kLightBlueColor,
                                fontFamily: "Poppins-Medium"),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                height: 555.h,
                width: double.infinity,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      children: [
                        details("Group B"),
                        bigDetail("Club Brugge", "Atletico Madrid", "2", "0"),
                        bigDetail("Arsenal FC", "Bayern Leverkusen", "2", "1"),
                        details("Group C"),
                        bigDetail(
                            "Fc Bayern Munchen", "Viktoria Plazen", "5", "0"),
                        bigDetail("Arsenal FC", "Bayern Leverkusen", "2", "1"),
                        details("Group B"),
                        bigDetail("Club Brugge", "Atletico Madrid", "2", "0"),
                        bigDetail(
                            "Fc Bayern Munchen", "Viktoria Plazen", "5", "0"),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget details(String title) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.h,
              decoration: const BoxDecoration(
                  color: kLightCircleColor, shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: Image.asset(
                  ball1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: kBlackColor,
                        fontFamily: "Poppins-Bold",
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Champion Lea gue",
                    style: TextStyle(
                      color: kLightGreyColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 8.sp,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 30.h,
              width: 30.h,
              decoration: const BoxDecoration(
                  color: kLightCircleColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: kLightGreyColor,
                  size: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bigDetail(
      String firstName, String secondName, String firstNo, String secondNo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                firstName: firstName,
                secondName: secondName,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        height: 110.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: const BoxDecoration(
                          color: kLightCircleColor, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(6.h),
                        child: Image.asset(
                          volleyball1,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: const BoxDecoration(
                          color: kLightCircleColor, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(2.r),
                        child: Image.asset(
                          volleyball2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "60'",
                      style: TextStyle(
                        color: kLightRedColor,
                        fontFamily: "Poppins-Medium",
                        fontSize: 12.sp,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: kLightCircleColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "View Detail",
                          style: TextStyle(
                            color: kBlackColor,
                            fontFamily: "Poppins-Medium",
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 7.w),
                        height: 30.h,
                        width: 30.h,
                        decoration: const BoxDecoration(
                            color: kBlackColor, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: kWhiteColor,
                            size: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    firstName,
                    style: TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    firstNo,
                    style: TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text(
                    secondName,
                    style: TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    secondNo,
                    style: TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
