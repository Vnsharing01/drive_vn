import 'package:drive_vn/core/utils/router/router_path.dart';
import 'package:drive_vn/feature/history/history_screen.dart';
import 'package:drive_vn/feature/home/home_screen.dart';
import 'package:drive_vn/feature/practice/practice_screen.dart';
import 'package:drive_vn/feature/review/review_screen.dart';
import 'package:drive_vn/feature/setting/setting_screen.dart';
import 'package:drive_vn/feature/training/training_screen.dart';
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
      path: RouterPath.practice,
      builder: (context, state) => const PracticeScreen(),
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
