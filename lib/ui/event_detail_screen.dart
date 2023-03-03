import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:livescoreapp/constant/color.dart';
import 'package:video_player/video_player.dart';

class EventDetails extends StatefulWidget {
  EventDetails(
      {required this.title,
      required this.subTitle,
      required this.no1,
      required this.no2,
      Key? key})
      : super(key: key);

  String title;
  String subTitle;
  String no1;
  String no2;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    initializePlayer();
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(srcs[currPlayIndex])
      ..pause();
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      additionalOptions: (context) {
        return <OptionItem>[
          // OptionItem(
          //   onTap: toggleVideo,
          //   iconData: Icons.live_tv_sharp,
          //   title: 'Toggle Video Src',
          // ),
        ];
      },
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }

  bool animate = false;
  double opacity = 1.0;
  double secondopacity = 0.0;

  List title = [
    "Ahmad Syaiful",
    "Lil Uzi Pret",
    "Robert Slavaskla",
    "Alvanso Moreno",
  ];

  List about = [
    "Goll!!! MIA SAN MIA BAYERN! 🔥🔥",
    "MIA SAN MIA BAYERN! 🔥🔥",
    "MIA SAN MIA!!!DANKE for all fans! 🎉",
    "FC Holiwood is the one! 😎",
  ];

  List imgList = [
    "assets/images/man.png",
    "assets/images/man2.png",
    "assets/images/girl.png",
    "assets/images/girl2.png",
  ];

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    setState(() {});
    await Future.delayed(
      const Duration(seconds: 1),
    );
    setState(() {
      animate = true;
    });
  }

  animationOpacity() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      opacity = 1;
      secondopacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: AnimationLimiter(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
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
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration: const BoxDecoration(
                          color: kSkyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          color: kWhiteColor,
                          size: 25.h,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2.w),
                        height: 60.h,
                        width: 60.h,
                        decoration: const BoxDecoration(
                          color: kSkyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.file_download,
                          color: kWhiteColor,
                          size: 25.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: const Duration(seconds: 2),
                    child: SlideAnimation(
                      verticalOffset: 400.0,
                      child: FadeInAnimation(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160.w,
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8.h),
                                            height: 30.h,
                                            width: 30.h,
                                            decoration: const BoxDecoration(
                                                color: kLightCircleColor,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.r),
                                              child: Image.asset(
                                                ball1,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.w, top: 8.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.title,
                                                  style: TextStyle(
                                                    color: kBlackColor,
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                                Text(
                                                  widget.subTitle,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xffd6d6d6),
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.h),
                                      child: Text(
                                        widget.no2,
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 28.sp,
                                            fontFamily: 'Poppins-Medium'),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Text(
                                        widget.no1,
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 28.sp,
                                            fontFamily: 'Poppins-Medium'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: const Duration(seconds: 3),
                    child: SlideAnimation(
                      verticalOffset: 400.0,
                      child: FadeInAnimation(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          height: 520.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 150.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.r),
                                        ),
                                      ),
                                      child: Chewie(
                                        controller: _chewieController!,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40.h),
                                    child: Center(
                                      child: Icon(
                                        Icons.play_circle_sharp,
                                        color: kBlackColor.withOpacity(0.5),
                                        size: 60.h,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                height: 40.h,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.r),
                                  ),
                                  color: const Color(0xff939da4),
                                ),
                                child: Center(
                                  child: Text(
                                    "View All Comments",
                                    style: TextStyle(
                                        color: kWhiteColor, fontSize: 13.sp),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 38.h),
                                height: 220.h,
                                color: Colors.transparent,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 4,
                                  padding: const EdgeInsets.all(0),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 14.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40.h,
                                            width: 40.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30.0.r),
                                              ),
                                              child: Image.asset(
                                                imgList[index],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title[index],
                                                  style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  about[index],
                                                  style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 40.h,
                                            width: 40.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30.r),
                                              ),
                                              color: kLightColor,
                                            ),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: kWhiteColor,
                                              size: 19.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Container(
                                            height: 40.h,
                                            width: 40.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30.r),
                                              ),
                                              color: kLightColor,
                                            ),
                                            child: Icon(
                                              Icons.messenger_outline,
                                              color: kWhiteColor,
                                              size: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 284.w,
                                    color: Colors.transparent,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.all(8.r),
                                          child: Image.asset(
                                            "assets/images/send.png",
                                            height: 8.h,
                                            color: kWhiteColor,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(
                                          color: kWhiteColor.withOpacity(0.6),
                                        ),
                                        hintText: "Type your comment...",
                                        fillColor: const Color(0xffc7c1bc),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 60.h,
                                    width: 70.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffc7c1bc),
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: EdgeInsets.all(18.r),
                                      child:
                                          Image.asset("assets/images/gift.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
