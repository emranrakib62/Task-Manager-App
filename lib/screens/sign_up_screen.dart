import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/App_colors.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
final TextEditingController _emailController=TextEditingController();
final TextEditingController _firstNameController=TextEditingController();
final TextEditingController _lastNamemailController=TextEditingController();
final TextEditingController _mobileController=TextEditingController();
final TextEditingController _passwordController=TextEditingController();




void _onTaplogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ScreenBackground(
            child: SingleChildScrollView(
              child: Form(

key: _formkey,


                child: Column(
                children: [
                  SizedBox(height: 150,),
                  Text("Join with Us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 25,),
                        
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Email'
                    ),
                  ),
                  SizedBox(height: 10,),
                        
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        hintText: 'First Name'
                    ),
                  ),
                  SizedBox(height: 10,),
                        
                        
                        
                  TextFormField(
                    controller: _lastNamemailController,
                    decoration: InputDecoration(
                        hintText: 'Last Name'
                    ),
                  ),



                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                        hintText: 'Last Name'
                    ),
                  ),
                        
                        
                  TextFormField(
                    controller: _passwordController,
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
                          ),
              ),
            ),),
        ),
      ),
    );
  }
}
