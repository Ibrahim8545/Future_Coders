import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/auth/prestation/screens/login_screen.dart';
import 'package:courseapp/features/auth/prestation/screens/signup_screen.dart';
import 'package:courseapp/features/main/main_layout.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        case Routes.profileView:
        return MaterialPageRoute(builder: (_) => ProfileView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
