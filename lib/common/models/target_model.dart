
//     "target": {
//       "dailyTargetAmount": 50000,
//       "achievedAmount": 18250,
//       "achievementPercentage": 36.5
//     },

class TargetModel {
  double dailyTargetAmount ;
  double achievedAmount;
  double achievementPercentage;

  TargetModel({
    required this.dailyTargetAmount,
    required this.achievedAmount,
  required this.achievementPercentage,
  });

  factory TargetModel.fromJson(
      Map<String,dynamic> json
      ){
    return TargetModel(
      dailyTargetAmount: json['dailyTargetAmount'],
      achievedAmount: json['achievedAmount'],
      achievementPercentage: json['achievementPercentage'],
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'dailyTargetAmount': dailyTargetAmount,
      'achievedAmount': achievedAmount,
      'achievementPercentage': achievementPercentage,
    };
  }

}