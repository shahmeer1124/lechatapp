import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/names.dart';
import '../store/user.dart';


/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
            route == AppRoutes.SIGN_IN ||
            route == AppRoutes.INITIAL
            //  ||  route == AppRoutes.Message
        
        ) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
