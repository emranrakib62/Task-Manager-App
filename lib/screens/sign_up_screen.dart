import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/service/api_caller.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/App_colors.dart';
import 'package:task_manager/utils/urls.dart';
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
bool isLoading =false;

Future<void> _signUp() async {
  Map<String,dynamic> requestBody={
    "email":_emailController.text,
    "firstName":_firstNameController.text,
    "lastName":_lastNamemailController.text,
    "mobile":_mobileController.text,
    "password":_passwordController.text,
  };
  setState(() {
    isLoading=true;
  });


  final ApiResponse response=await ApiCaller.PostRequest(
      URL:Urls.signUpURL,
    body:requestBody,

  );
  setState(() {
    isLoading=false;
  });

if(response.isSuccess){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up success..!')));
}else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
}

}

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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter email';
                      } else {
                        return null;
                      }
                    },





                  ),
                  SizedBox(height: 10,),
                        
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        hintText: 'First Name'
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter First name';
                        } else {
                          return null;
                        }
                      }

                  ),
                  SizedBox(height: 10,),
                        
                        
                        
                  TextFormField(
                    controller: _lastNamemailController,
                    decoration: InputDecoration(
                        hintText: 'Last Name'
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Last name';
                        } else {
                          return null;
                        }
                      }



                  ),



                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                        hintText: 'mobile'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter phone number';
                      } else if (value.length != 11) {
                        return 'Please enter correct phone number';
                      } else {
                        return null;
                      }
                    },


                  ),
                        
                        
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        
                        hintText: 'Password'
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        } else {
                          return null;
                        }
                      }
                  ),
                  isLoading?Center(child: CircularProgressIndicator()):FilledButton(onPressed: (){

                    if(_formkey.currentState!.validate()){

                 _signUp();




                    }

                  }, child: Icon(Icons.arrow_circle_right_outlined)),
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
