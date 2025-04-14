import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/auth/prestation/screens/confirn_change_password.dart';
import 'package:courseapp/features/auth/prestation/screens/forget_passsword_screen.dart';
import 'package:courseapp/features/auth/prestation/screens/login_screen.dart';
import 'package:courseapp/features/auth/prestation/screens/otp_screen.dart';
import 'package:courseapp/features/auth/prestation/screens/repassword_screen.dart';
import 'package:courseapp/features/auth/prestation/screens/signup_screen.dart';
import 'package:courseapp/features/main/community/presentaion/views/publish_posts_view.dart';
import 'package:courseapp/features/main/cources/presentation/views/progress_view.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/full_articles_view.dart';
import 'package:courseapp/features/main/fathers/presentaion/views/full_books_view.dart';
import 'package:courseapp/features/main/home/presentation/views/games_view.dart';
import 'package:courseapp/features/main/home/presentation/views/programming_view.dart';
import 'package:courseapp/features/main/home/presentation/views/video_player_view.dart';
import 'package:courseapp/features/main/main_layout.dart';
import 'package:courseapp/features/main/settings/presentation/views/edit_profile_view.dart';
import 'package:courseapp/features/main/settings/presentation/views/favourite_view.dart';
import 'package:courseapp/features/main/settings/presentation/views/help_view.dart';
import 'package:courseapp/features/main/settings/presentation/views/profile_view.dart';
import 'package:courseapp/features/onboarding/prestatation/views/onbarding_view.dart';
import 'package:courseapp/features/quiz/presentation/views/quiz_home.dart';
import 'package:courseapp/features/quiz/presentation/views/splash_quiz.dart';
import 'package:courseapp/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.profileView:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case Routes.favView:
        return MaterialPageRoute(builder: (_) => const FavouriteView());
      case Routes.helpView:
        return MaterialPageRoute(builder: (_) => const HelpView());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.repassword:
        return MaterialPageRoute(builder: (_) => const RepasswordScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardindScreen());
      case Routes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizPage());

      case Routes.confirmChangePasswordSplashScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmChangePasswordSplashScreen());
      case Routes.articlesView:
        return MaterialPageRoute(builder: (_) => const FullArticlesView());
      case Routes.booksView:
        return MaterialPageRoute(builder: (_) => const FullBooksView());
      case Routes.programmingView:
        return MaterialPageRoute(builder: (_) => const ProgrammingView());
      case Routes.gamesView:
        return MaterialPageRoute(builder: (_) => GamesView());
        case Routes.splashQuiz:
        return MaterialPageRoute(builder: (_) => const SplashQuizScreen());
        case Routes.publishPosts:
        return MaterialPageRoute(builder: (_) => const PublishPostsView());
      case Routes.videoPlayerView:
        final youtubeUrl = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => VideoPlayerView(
            youtubeUrl: youtubeUrl,
          ),
        );
      case Routes.progressView:
        return MaterialPageRoute(builder: (_) => const ProgressView());

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
