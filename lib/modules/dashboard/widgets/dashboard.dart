import 'package:flutter/material.dart';
import 'package:pda_app/common/services/dashboard_service.dart';
import 'package:pda_app/modules/dashboard/widgets/dashboard_obj.dart';
import 'package:pda_app/modules/login/widgets/verify_otp_main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Dashboard"),
      ),
      body: Text("Dashboard is heree"),
    );
  }
}
