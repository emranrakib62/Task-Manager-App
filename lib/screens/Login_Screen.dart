import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/Screen_background.dart';
import 'package:task_manager/utils/App_colors.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ScreenBackground(child: Column(
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
                TextButton(onPressed: (){}, child: Text('Forget Password ?',style: TextStyle(color: Colors.grey))),

                RichText(text: TextSpan(
                  text: "Don't have an account?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: 'Sign up',style: TextStyle(color: AppColors.pcolor,fontWeight:FontWeight.bold)
                    )
                  ]

                ))
              ],
            ),
          )
          
          ],
        ),),
      ),
    );
  }
}
