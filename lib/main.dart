import 'dart:io';
import 'package:al_quran/core/resources/constants/screen_path.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await Hive.initFlutter();
  serviceLocator();
  await Hive.openBox('tasbeehBox');
  Hive.registerAdapter(BookmarkModelAdapter());
  await Hive.openBox('themeBox');
  if (!Hive.isBoxOpen('bookmark_box')) {
    await Hive.openBox<BookmarkModel>('bookmark_box');
  }

  ///PLATFORM CHECK
  if (kIsWeb || (!kIsWeb && !Platform.isAndroid)) {
    runApp(DevicePreview(builder: (context) => MyApp()));
  } else {
    runApp(MyApp());
  }
}