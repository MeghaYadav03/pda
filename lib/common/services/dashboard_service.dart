import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:pda_app/common/models/dashboard_model.dart';
class DashboardService {

  Future<DashboardModel?> getDashboard({
    required String salesmanId,
  }) async {

    String dashboardJsonString =
    await rootBundle.loadString('assets/mock/dashboard_response.json');

    List<dynamic>temp = jsonDecode(dashboardJsonString);
    List <DashboardModel> users = temp.map((e)=>
        DashboardModel.fromJson(e as Map<String,dynamic>)
    ).toList();

    DashboardModel? user;

    user = users.firstWhereOrNull((e)=>e.salesmanId == salesmanId);

    if (user != null) {
      print("Dashboard data for ${user.salesmanId} loaded successfully");
    } else {
      print("Dashboard not found");
    }

    return user;
  }

}
