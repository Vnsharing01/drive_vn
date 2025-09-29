import 'package:drivevn/core/utils/router/router_path.dart';
import 'package:drivevn/feature/history/history_screen.dart';
import 'package:drivevn/feature/home/home_screen/home_screen.dart';
import 'package:drivevn/feature/practice/practive_finish.dart/practive_finish_screen.dart';
import 'package:drivevn/feature/practice/practive_screen.dart/practice_screen.dart';
import 'package:drivevn/feature/practice/practive_start.dart/practive_start_screen.dart';
import 'package:drivevn/feature/review/review_screen.dart';
import 'package:drivevn/feature/setting/setting_screen.dart';
import 'package:drivevn/feature/training/training_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter appRouter = GoRouter(routes: [
    GoRoute(
      path: RouterPath.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouterPath.training,
      builder: (context, state) => const TrainingScreen(),
    ),
    GoRoute(
      path: RouterPath.practiceStart,
      builder: (context, state) => const PractiveStartScreen(),
    ),
    GoRoute(
      path: RouterPath.practice,
      builder: (context, state) => const PracticeScreen(),
    ),
    GoRoute(
      path: RouterPath.practiceFinish,
      builder: (context, state) => const PractiveFinishScreen(),
    ),
    GoRoute(
      path: RouterPath.review,
      builder: (context, state) => const ReviewScreen(),
    ),
    GoRoute(
      path: RouterPath.history,
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: RouterPath.settings,
      builder: (context, state) => const SettingScreen(),
    ),
  ]);
}
