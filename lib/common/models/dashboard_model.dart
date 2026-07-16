
//
//     "salesmanId": "100001",
//
//   "dashboard": {

//     "date": "2026-07-16",
//     "target": {
//       "dailyTargetAmount": 50000,
//       "achievedAmount": 18250,
//       "achievementPercentage": 36.5
//     },

//     "orders": {
//       "totalOrders": 18,
//       "productiveCalls": 12,
//       "nonProductiveCalls": 6
//     },
//
//     "retailers": {
//       "plannedVisits": 35,
//       "visited": 18,
//       "pending": 17
//     },
//
//     "collection": {
//       "targetCollection": 15000,
//       "collectedAmount": 8200
//     },
//
//     "stock": {
//       "lowStockItems": 4,
//       "outOfStockItems": 1
//     },
//
//     "attendance": {
//       "checkIn": "09:05 AM",
//       "status": "Checked In"
//     }
//   }
// }

import 'package:pda_app/common/models/target_model.dart';
class DashboardModel {
  String salesmanId;
  String date;
  TargetModel target;

  DashboardModel({
    required this.salesmanId,
    required this.date,
    required this.target
});


  factory DashboardModel.fromJson(
      Map<String,dynamic> json
      ){
    return DashboardModel(
      salesmanId: json['salesmanId'],
      date: json['dashboard']['date'],
      target: TargetModel.fromJson(json['dashboard']['target']),
    );
  }
  Map<String,dynamic> toJson(){
    return{
      'salesmanId': salesmanId,
      'date': date,
    };
  }



}