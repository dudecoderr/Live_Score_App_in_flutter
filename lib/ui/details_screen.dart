import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livescoreapp/constant/color.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    decoration: const BoxDecoration(
                      color: kSkyBlueColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: kWhiteColor,
                      size: 25.h,
                    ),
                  ),
                ),
                const Spacer(),
                Text(""),
                const Spacer(),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: const BoxDecoration(
                    color: kSkyBlueColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: kWhiteColor,
                    size: 25.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
