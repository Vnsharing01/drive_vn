import 'package:drivevn/core/router/router_path.dart';
import 'package:drivevn/feature/history/history_screen.dart';
import 'package:drivevn/feature/main/bloc/main_bloc.dart';
import 'package:drivevn/feature/main/main_page.dart';
import 'package:drivevn/feature/home/bloc/home_bloc.dart';
import 'package:drivevn/feature/home/home_screen.dart';
import 'package:drivevn/feature/practice/practive_detail/bloc/practive_detail_bloc.dart';
import 'package:drivevn/feature/practice/practive_finish/bloc/practive_finish_bloc.dart';
import 'package:drivevn/feature/practice/practive_finish/practive_finish_screen.dart';
import 'package:drivevn/feature/practice/practive_detail/practive_detail_screen.dart';
import 'package:drivevn/feature/practice/practive_start/practive_start_screen.dart';
import 'package:drivevn/feature/review/review_detail/bloc/review_detail_bloc.dart';
import 'package:drivevn/feature/review/review_detail/review_detail_screen.dart';
import 'package:drivevn/feature/review/review_start/review_start_screen.dart';
import 'package:drivevn/feature/setting/setting_screen.dart';
import 'package:drivevn/feature/training/training/bloc/training_bloc.dart';
import 'package:drivevn/feature/training/training/training_screen.dart';
import 'package:drivevn/feature/training/training_detail/bloc/training_detail_bloc.dart';
import 'package:drivevn/feature/training/training_detail/training_detail_screen.dart';
import 'package:drivevn/feature/training/training_questions/bloc/training_questions_bloc.dart';
import 'package:drivevn/feature/training/training_questions/training_questions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter appRouter = GoRouter(routes: [
    GoRoute(
      path: RouterPath.main,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
        ],
        child: const MainPage(),
      ),
    ),
    GoRoute(
      path: RouterPath.home,
      builder: (context, state) => BlocProvider(
        create: (_) => HomeBloc(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.training,
      builder: (context, state) => BlocProvider(
        create: (_) => TrainingBloc(),
        child: const TrainingScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.trainingQuestions,
      builder: (context, state) => BlocProvider(
        create: (_) => TrainingQuestionsBloc(),
        child: const TrainingQuestionsScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.trainingDetail,
      builder: (context, state) => BlocProvider(
        create: (_) => TrainingDetailBloc(),
        child: const TrainingDetailScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.practiceStart,
      builder: (context, state) => const PractiveStartScreen(),
    ),
    GoRoute(
      path: RouterPath.practice,
      builder: (context, state) => BlocProvider(
        create: (_) => PractiveDetailBloc(),
        child: const PractiveDetailScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.practiceFinish,
      builder: (context, state) => BlocProvider(
        create: (_) => PractiveFinishBloc(),
        child: const PractiveFinishScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.reviewStart,
      builder: (context, state) => const ReviewScreen(),
    ),
    GoRoute(
      path: RouterPath.review,
      builder: (context, state) => BlocProvider(
        create: (_) => ReviewDetailBloc(),
        child: const ReviewDetailScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.reviewFinish,
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
