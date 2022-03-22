import '../../../modules/authentication/login/login_screen.dart';
import '../../../network/loacal/cache_helper.dart';

import 'package:flutter/material.dart';

String? get uId => CacheHelper.getData(key: 'uId') ;

String? token;

void logOut(context) {
  CacheHelper.removeData(key: 'uId');
  navigateAndFinish(widget: Login(), context: context);
}

void navigateTo({required context, required Widget widget}) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => widget));
}

void navigateAndFinish({required context, required Widget widget}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
