import 'package:flutter/material.dart';
import 'data/local/db/app_database.dart';
import 'presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  runApp(const MyApp());
}
