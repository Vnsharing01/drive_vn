import 'package:drivevn/core/constants/get_it.dart';
import 'package:drivevn/core/router/app_router.dart';
import 'package:drivevn/data/locals/quizzes_database.dart';
import 'package:drivevn/data/models/answer_collection.dart';
import 'package:drivevn/data/models/question_collection.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  await initializeDB();
  runApp(const MyApp());
}

/// Phương thức khởi tạo database
/// Chỉ chạy 1 lần khi app khởi động
Future<void> initializeDB() async {
  // final Isar? isar = Isar.getInstance();
  // if (isar != null) return;

  // Mở Isar database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    // Danh sách các schema (cấu trúc bảng) cần sử dụng
    [QuestionCollectionSchema, AnswerCollectionSchema],
    directory: dir.path,
    name: 'quizzesDB', // Tên file database (sẽ tạo file quizzesDB.isar)
  );
  getIt.registerSingleton<Isar>(isar);

  await QuizzesDatabase(isar: isar).importDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'drivevn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().appRouter,
    );
  }
}
