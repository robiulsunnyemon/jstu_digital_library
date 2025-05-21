import 'package:citybookstore/core/services/api_service.dart';
import 'package:citybookstore/features/auth/presentations/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/url.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../routes/routes.dart';
import '../../../routes/routes_name.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() {
    if (_formKey.currentState!.validate()) {
      // Registration logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful!')),
      );
      Navigator.pop(context); // Back to login
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
            padding: EdgeInsets.all(16.w),
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
                        "Create an Account",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        AppUrls.threeStar,
                        width: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome! Please enter your details",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        )),
                        prefixIcon: const Icon(Icons.person_2_outlined)),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildEmailTextFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPasswordTextFormField(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppColors.primaryColor,
                      ),
                      Text(
                        "Must be at lest 8 character",
                        style: TextStyle(color: AppColors.grayColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Sign Up",
                      onTap: () async{
                        Map<dynamic,dynamic> body={
                          "username": nameController.text.trim(),
                          "email": emailController.text.trim(),
                          "password": passwordController.text.trim()
                        };
                        bool response=await ApiService.registrationUser(body);
                        if(response){
                          customSnackBar(title: "Account created successfully");
                          if(context.mounted){
                            Navigator.pushReplacementNamed(context, RoutesName.loginPage);
                          }
                        }else{
                          customSnackBar(title: "Account created fail");
                        }
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or sign up with",
                          style: TextStyle(
                            color: AppColors.grayColor,
                          ),
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
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: AppColors.grayColor),
                      ),
                      CustomTextButton(
                        text: "Log In",
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.loginPage);
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

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
          hintText: 'Password',
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.primaryColor,
          )),
          prefixIcon: const Icon(Icons.password)),
      obscureText: true,
      validator: (value) => value!.isEmpty ? 'Enter your password' : null,
    );
  }

  Widget _buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
          hintText: 'Email',
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.primaryColor,
          )),
          prefixIcon: const Icon(Icons.email_outlined)),
      validator: (value) => value!.isEmpty ? 'Enter your email' : null,
    );
  }
}
