import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/data/service/api_caller.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/screens/forget_password_email_verify.dart';
import 'package:task_manager/utils/App_colors.dart';
import 'package:task_manager/utils/urls.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();


  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
bool isLoading=false;


  Future<void> _signIn() async {
    Map<String,dynamic> requestBody={
      "email":_emailController.text,
      "password":_passwordController.text,
    };
    setState(() {
      isLoading=true;
    });


    final ApiResponse response=await ApiCaller.PostRequest(
      URL:Urls.LoginUrl,
      body:requestBody,

    );
    setState(() {
      isLoading=false;
    });

    if(response.isSuccess){

      UserModel model=UserModel.fromJson(response.responseData['data']);



      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in success..!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }

  }


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

            child: Form(
            key: _formkey,

              child: Column(
              children: [
                SizedBox(height: 150,),
                Text("Get Started With",
                style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 25,),

                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter email';
                    } else {
                      return null;
                    }
                  },




                        decoration: InputDecoration(
              hintText: 'Email'
                        ),
                ),
                SizedBox(height: 10,),
                TextFormField(
               controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter First name';
                    } else {
                      return null;
                    }
                  },


                  obscureText: true,
                  decoration: InputDecoration(

                      hintText: 'Password'
                  ),
                ),
                FilledButton(onPressed: (){

                  if(_formkey.currentState!.validate()){

                      _signIn();



                  }





                }, child: Icon(Icons.arrow_circle_right_outlined)),
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
                        ),
            ),),
        ),
      ),
    );
  }
}
