

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/url.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../routes/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      // Login logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );
    }
  }

  final List<String> _iconUrl = [
    "assets/img/apple_icon.png",
    "assets/img/google_icon.png",
    "assets/img/facebook_icon.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        AppUrls.threeStar,
                        width: 30,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome back! Please enter your details",
                    style: TextStyle(fontSize: 16,color: AppColors.grayColor,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildEmailTextFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildPasswordTextFormField(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: AppColors.primaryColor,
                          ),
                          Text("Remember for 30 days",style: TextStyle(color: AppColors.grayColor),),
                        ],
                      ),
                      CustomTextButton(
                        onTap: () {},
                        text: "Forgot Password",
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Log In",
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.bottomNavigationBar, (route) => false);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or log in with",
                          style: TextStyle(color: AppColors.grayColor),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Image.asset(
                                _iconUrl[i],
                                width: 40,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(color: AppColors.grayColor),),
                      CustomTextButton(
                        text: "Sign up",
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.registerPage);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextFormField() => _buildBuildEmailTextFormField();

  Widget _buildPasswordTextFormField() => _buildTextFormField();

  Widget _buildBuildEmailTextFormField() => buildEmailTextFormField();

  Widget buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
          hintText: 'Email',
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          prefixIcon: const Icon(Icons.email_outlined)),
      validator: (value) => value!.isEmpty ? 'Enter your email' : null,
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        prefixIcon: const Icon(Icons.password),
        suffixIcon: Icon(Icons.remove_red_eye_outlined)
      ),
      obscureText: true,
      validator: (value) => value!.isEmpty ? 'Enter your password' : null,
    );
  }
}
