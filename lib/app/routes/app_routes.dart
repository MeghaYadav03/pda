import 'package:flutter/material.dart';

import 'package:pda_app/modules/login/widgets/login_form.dart';
import 'package:pda_app/modules/login/widgets/verify_otp_main.dart';
import 'package:pda_app/modules/dashboard/widgets/dashboard.dart';
import 'route_names.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> routes = {
    RouteNames.login: (context) => const LoginForm(),

    RouteNames.otp: (context) => const VerifyOtpMain(),
    RouteNames.dashboard: (context) => const Dashboard(),

  };
}