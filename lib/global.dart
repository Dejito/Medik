import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:medik/common/service/storage_service.dart';

class Global {
  static StorageService storageService = StorageService();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBHYlgxWVe9JBHN3IdBrdkryzEzd1GBgrE",
      appId: "1:58523797120:android:5a2b834e3b5d9a01764865",
      messagingSenderId: "dejito",
      projectId: "shopappwithbloc",
    ));
    // storageService = await StorageService().init();
  }
}
