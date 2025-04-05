import 'package:courseapp/config/routes/route_generator.dart';
import 'package:courseapp/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CoursesApp());
}

class CoursesApp extends StatelessWidget {
  const CoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        locale: Locale('ar'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
