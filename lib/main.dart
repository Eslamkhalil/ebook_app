import 'package:bloc/bloc.dart';
import 'package:ebook_app/utils/components/shared/constants.dart';
import 'package:ebook_app/utils/my_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'modules/authentication/login/login_screen.dart';
import 'modules/home_screen/home.dart';
import 'network/loacal/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.initCacheHelper();

  Widget widget;
  if (uId != null) {
    widget = Home();
  } else {
    widget = Login();
  }
  BlocOverrides.runZoned(() {
      runApp(MyApp(
        widget: widget,
      ));
    },

    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: widget,
    );
  }
}
