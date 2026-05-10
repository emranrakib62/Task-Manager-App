import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/screens/forget_password_email_verify.dart';
import 'package:task_manager/utils/App_colors.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  void _onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ScreenBackground(
        
            child: Column(
            children: [
              SizedBox(height: 150,),
              Text("Get Started With",
              style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25,),
              
              TextFormField(
          decoration: InputDecoration(
            hintText: 'Email'
          ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
        
                    hintText: 'Password'
                ),
              ),
              FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),
            SizedBox(height: 35),
              Center(
              child: Column(
                children: [
                  TextButton(onPressed: (){
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVerify()));
        
                    
                  }, child: Text('Forget Password ?',style: TextStyle(color: Colors.grey))),
        
                  RichText(text: TextSpan(
                    text: "Don't have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: 'Sign up',style: TextStyle(color: AppColors.pcolor,fontWeight:FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap=_onTapSignUp
                      )
                    ]
        
                  ))
                ],
              ),
            )
            
            ],
          ),),
        ),
      ),
    );
  }
}
