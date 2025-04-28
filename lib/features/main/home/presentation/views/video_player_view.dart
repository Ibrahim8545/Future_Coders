import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_row_details_course.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.youtubeUrl});

  final String youtubeUrl;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayerViewBody(controller: controller),
    );
  }
}

class VideoPlayerViewBody extends StatelessWidget {
  const VideoPlayerViewBody({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 71.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),
                child: Text(
                  'تفاصيل الدورة التدريبية',
                  style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                child: Text(
                  'ابدأ تجربتك المجانية لمدة ١٤ يوم!',
                  style:
                      getBoldStyle(color: ColorManager.yellow, fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                    liveUIColor: ColorManager.red600,
                    progressIndicatorColor: Colors.grey,
                    onReady: () => debugPrint("Ready"),
                    bottomActions: const [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.redAccent,
                        ),
                      ),
                      PlaybackSpeedButton(),
                      FullScreenButton(),
                      PlaybackSpeedButton(),
                      PlayPauseButton(),
                      RemainingDuration(),
                    ],
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("مقدمة الي البرمجة",
                          style: getBoldStyle(color: ColorManager.black500)),
                      Text(
                        r"$250",
                        style: getBoldStyle(color: ColorManager.secondary400),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "هذه الدورة مصممة للاطفال للمبتدئة لتعلم الأساسيات الأولى في البرمجة بشكل بسيط وممتع. سنتعرف على كيفية كتابة الأوامر التي يفهمها الكمبيوتر لتنفيذ المهام، مع فهم المفاهيم الأساسية",
                      style: getMediumStyle(
                          color: ColorManager.grey1, fontSize: 14),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "(٤.٩)",
                      style: getBoldStyle(color: ColorManager.secondary400),
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 35,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowDetailsCourse(
                              iconData: Icons.accessibility, title: 'مبتدأ'),
                          SizedBox(height: 8),
                          CustomRowDetailsCourse(
                              iconData: Icons.access_time, title: '٧ اسابيع'),
                          SizedBox(height: 8),
                          CustomRowDetailsCourse(
                              iconData: Icons.school, title: '+٣٦٥ طالب'),
                        ],
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowDetailsCourse(
                              iconData: Icons.language, title: 'العربية'),
                          SizedBox(height: 8),
                          CustomRowDetailsCourse(
                              iconData: Icons.menu_book, title: '٤ دروس'),
                          SizedBox(height: 8),
                          CustomRowDetailsCourse(
                              iconData: Icons.person, title: 'م. أحمد علي'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
                child: Text(
                  "ما المحتوى الذي سوف يتعمله طفلك ؟",
                  style: getBoldStyle(
                    color: ColorManager.black500,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              const CustomContentOfCourseTextWidget(content: "ما هي البرمجة ولماذا هي مهمة ؟",),
              const CustomContentOfCourseTextWidget(content: "كيف تعمل اجهزة الكمبيوتر ؟",),
              const CustomContentOfCourseTextWidget(content: "فكره عامة عن لغات البرمجة",),
            ],
          ),
        ),
        const CustomAppBar()
      ],
    );
  }
}

class CustomContentOfCourseTextWidget extends StatelessWidget {
  const CustomContentOfCourseTextWidget({super.key, required this.content});
final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            content,
            style: getMediumStyle(
              color: ColorManager.black500,
              fontSize: 18.sp,
            ),
          ),
          Image.asset(
            IconsAssets.BULBCIcon,
          )
        ],
      ),
    );
  }
}
