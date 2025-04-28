import 'package:courseapp/config/routes/route_generator.dart';
import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/api_keys.dart';
import 'package:courseapp/core/utils/observer.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:courseapp/core/injectable.dart' as di;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await Supabase.initialize(
    url: "https://dgmfnqctghiobzvnoonf.supabase.co",
    anonKey:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRnbWZucWN0Z2hpb2J6dm5vb25mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ5MTU5ODQsImV4cCI6MjA2MDQ5MTk4NH0.PueY4v3DaKGsni2Eeb6a0WR6KtWudClkmKu8bJbsq4g",
    authOptions: FlutterAuthClientOptions(

    )
  );
  await di.init();
  Bloc.observer =MyBlocObserver();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PostsProvider()),
    ],
      child: const CoursesApp()));
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
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
