import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Widgets/screen_background.dart';
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


            PinInput(
              length: 4,
              builder: (context, cells) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cells.map((cell) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cell.isFocused ? Colors.blue : Colors.grey[200],
                      ),
                      child: Center(
                        child: Text(
                          cell.character ?? '',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              onCompleted: (pin) => print('PIN: $pin'),
            ),


              SizedBox(height: 20),
              FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),
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
