import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/Screen_background.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Column(
        children: [
          Text("Get Started With",
          style: Theme.of(context).textTheme.titleLarge,
          ),
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
          FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))
        ],
      ),),
    );
  }
}
