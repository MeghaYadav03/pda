import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pda_app/common/services/auth_service/verify_otp_services.dart';
import 'package:pda_app/app/routes/route_names.dart';
import 'package:pda_app/common/services/auth_service/login_service.dart';
import 'package:pda_app/common/models/user_model.dart';
class VerifyOtpMain extends StatefulWidget {

  const VerifyOtpMain({super.key});

  @override
  State<VerifyOtpMain> createState() => _VerifyOtpMainState();
}

class _VerifyOtpMainState extends State<VerifyOtpMain> {


  final OTPService otpService = OTPService();
  bool hasOtpError = false;
  static const String incorrectOTPError = "Incorrect OTP. Please try again!";
  final UserModel user =
  ModalRoute.of(context)!.settings.arguments as UserModel;
   void verifyEnteredOTP (int userEnteredOtp){
    if(otpService.verifyOTP(enteredOTP: userEnteredOtp)){
      setState(() {
        hasOtpError = false;
      });

      Navigator.pushReplacementNamed(
        context,
        RouteNames.dashboard,
        arguments: user,
      );
    }
    else{
      setState(() {
        hasOtpError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("OTP Verification"),
        ),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("OTP is ${otpService.displayOTP()}"),
        OtpTextField(
          numberOfFields: 4,
            borderColor: Color(0xFF512DA8),
          showFieldAsBox: true,
            onSubmit: (String code) {
              final otp = int.tryParse(code);
              if (otp != null) {
                verifyEnteredOTP(otp);
              }
            }
        ),

        Text(
          hasOtpError ? incorrectOTPError : "",
        ),

      ],
    ));
  }
}
