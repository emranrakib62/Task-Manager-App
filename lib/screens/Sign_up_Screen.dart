import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/Screen_background.dart';
import 'package:task_manager/screens/Login_Screen.dart';
import 'package:task_manager/screens/Sign_up_Screen.dart';
import 'package:task_manager/utils/App_colors.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void _onTaplogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ScreenBackground(child: Column(
          children: [
            SizedBox(height: 150,),
            Text("Join with Us",
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
              decoration: InputDecoration(
                  hintText: 'First Name'
              ),
            ),
            SizedBox(height: 10,),



            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Last Name'
              ),
            ),


            TextFormField(
              obscureText: true,
              decoration: InputDecoration(

                  hintText: 'Password'
              ),
            ),
            FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),
            SizedBox(height: 35),
            Center(
              child: RichText(text: TextSpan(
                  text: "Have an account?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: 'Login',style: TextStyle(color: AppColors.pcolor,fontWeight:FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap=_onTaplogin
                    )
                  ]

              )),
            )

          ],
        ),),
      ),
    );
  }
}
