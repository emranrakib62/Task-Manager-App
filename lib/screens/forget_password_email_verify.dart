import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/forget_password_otp_verification.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/App_colors.dart';
class ForgetPasswordEmailVerify extends StatefulWidget {
  const ForgetPasswordEmailVerify({super.key});

  @override
  State<ForgetPasswordEmailVerify> createState() => _ForgetPasswordEmailVerifyState();
}

class _ForgetPasswordEmailVerifyState extends State<ForgetPasswordEmailVerify> {

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
              Text("Your Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25,),
        
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
              ),
              SizedBox(height: 20),
              FilledButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordOtpVerification()));
              }, child: Icon(Icons.arrow_circle_right_outlined)),
              SizedBox(height: 35),
              Center(
                child: RichText(text: TextSpan(
                    text: " have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: 'Login',style: TextStyle(color: AppColors.pcolor,fontWeight:FontWeight.bold),
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
