
import 'dart:math';


class OTPService {
  int generatedOTP = 1234;
  bool verifyOTP({
    required int enteredOTP,
  }) {
    if (enteredOTP == generatedOTP) {
      return true;
    }
    else {
      return false;
    }
  }
int? displayOTP()  {

    return generatedOTP;

  }
}

// class OTPService {
//   int ?generatedOTP;
//
//   bool verifyOTP({
//     required int enteredOTP,
//   }) {
//
//     if(enteredOTP==generatedOTP ){
//       return true;
//     }
//     else{
//       return false;
//     }
//   }
//
//   void generateOTP() async {
//
//     generatedOTP = Random().nextInt(9000) + 1000;
//
//   }
//
//   int? displayOTP()  {
//
//     return generatedOTP;
//
//   }
//
// }
//
//
