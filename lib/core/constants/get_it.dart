import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

final SharedPreferences preferences = getIt<SharedPreferences>();
final Isar isarInstance = getIt<Isar>();
