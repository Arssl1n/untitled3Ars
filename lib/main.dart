import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled3/model/hive%20/label.dart';
import 'package:untitled3/model/hive%20/task.dart';
import 'package:untitled3/model/hive%20/user.dart';
import 'package:untitled3/ui/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();

  // We initialize Hive and we give him the current path
  Hive.init(appDocDir.path);
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(LabelAdapter());
  Hive.registerAdapter(UserAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Collage Up',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SplashPage(),
    );
  }
}