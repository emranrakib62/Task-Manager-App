import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/forget_password_set_password.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/App_colors.dart';
class ForgetPasswordOtpVerification extends StatefulWidget {
  const ForgetPasswordOtpVerification({super.key});

  @override
  State<ForgetPasswordOtpVerification> createState() => _ForgetPasswordOtpVerificationState();
}

class _ForgetPasswordOtpVerificationState extends State<ForgetPasswordOtpVerification> {

  void _onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ScreenBackground(child: Column(
            children: [
              SizedBox(height: 150,),
              Text("PIN Verification",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25,),


              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: true,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(7),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey.shade300,
                  selectedColor: AppColors.pcolor2,
                ),
                backgroundColor: Colors.transparent,
              ), // PinCodeTextField

              SizedBox(height: 20),
              FilledButton(onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordSetPassword(),
                  ),
                );
              }, child: Icon(Icons.arrow_circle_right_outlined)),
              SizedBox(height: 35),
              Center(
                child: RichText(text: TextSpan(
                    text: " have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: 'Sign in',style: TextStyle(color: AppColors.pcolor,fontWeight:FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap=_onTapSignUp
                      )
                    ]

                )),
              )

            ],
          ),),
        ),
      ),
    );
  }
}
