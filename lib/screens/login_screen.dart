import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/screen_background.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/screens/forget_password_email_verify.dart';
import 'package:task_manager/utils/App_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainNavScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 150),

                Text(
                  "Get Started With",
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 25),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),

                const SizedBox(height: 16),

                FilledButton(
                  onPressed: _goToHome,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),

                const SizedBox(height: 35),

                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ForgetPasswordEmailVerify(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: AppColors.pcolor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapSignUp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//With API Calling codde
/*
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Controller/auth_controller.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signIn() async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    };

    setState(() {
      _isLoading = true;
    });

    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.LoginUrl,
      body: requestBody,
    );

    if (!mounted) return; // Guard against context being unmounted during async gap

    setState(() {
      _isLoading = false;
    });

    if (response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];
      await AuthController.saveUserData(model, accessToken);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in success..!')),
      );
    } else {
      // Safe fallback handling for error messages
      final errorMessage = response.responseData?['message'] ?? response.responseData?['data'] ?? 'Something went wrong!';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage.toString())),
      );
    }
  }

  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground( // Removed duplicate nesting here
        child: SingleChildScrollView( // Wrap in SingleChildScrollView to prevent overflow when keyboard appears
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  Text(
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'; // Fixed error message text
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity, // Makes the button full width for better UX
                    child: FilledButton(
                      onPressed: _isLoading
                          ? null // Disables button while loading
                          : () {
                        if (_formKey.currentState!.validate()) {
                          _signIn();
                        }
                      },
                      child: _isLoading
                          ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      )
                          : const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgetPasswordEmailVerify()),
                            );
                          },
                          child: const Text('Forgot Password?', style: TextStyle(color: Colors.grey)),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(color: AppColors.pcolor, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()..onTap = _onTapSignUp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
