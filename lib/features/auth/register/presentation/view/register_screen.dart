import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_style/app_style.dart';
import 'package:movie_app/core/funcation/funcation.dart';
import 'package:movie_app/core/sqflite_services/sqflite_services.dart';
import 'package:movie_app/core/widgets/custom_back_button.dart';
import 'package:movie_app/core/widgets/custom_text_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_filed.dart';
import 'package:movie_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:movie_app/features/auth/register/data/userModel.dart';
import 'package:movie_app/features/onboarding/home.dart';

class RegisterScreen extends StatelessWidget {
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  List<Users> usersList = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    children: [
                      CustomBackButton(
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: Image(
                  image: const AssetImage('assets/images/app_icon.png'),
                  height: 150.h,
                  width: 150.w,
                )),
                SizedBox(
                  height: 43.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: AppStyles.style33,
                        ),
                        Text('Enter your details below',
                            style: AppStyles.style18),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'UserName',
                          style: AppStyles.style24,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                          obscureText: false,
                          controller: userNameController,
                          title: 'Enter your username',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'E-mail',
                          style: AppStyles.style24,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                          obscureText: false,
                          controller: emailController,
                          title: 'Enter your e-mail',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your e-mail';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      
                        Text(
                          'Phone',
                          style: AppStyles.style24,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                          obscureText: false,
                          controller: phoneController,
                          title: 'Enter your phone',
                          keyboardType: const TextInputType.numberWithOptions(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Password',
                          style: AppStyles.style24,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          controller: passwordController,
                          title: 'Enter your password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Confirm Password',
                          style: AppStyles.style24,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          title: 'Enter your Confirm Password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // else if(passwordController != confirmPasswordController){
                            //   return 'wrong password';
                            // }
                            return null;
                          },
                        ),
                        //SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account !',
                              style: AppStyles.style18,
                            ),
                            TextButton(
                                onPressed: () {
                                    navigate(context:context, screen: LoginScreen());
                      
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xffFFC700),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextButton(
                            title: 'Register',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                    'Sucess!',
                                    style: TextStyle(color: Colors.yellow),
                                  )),
                                );
                      
                                SqfliteServices().saveData(
                                  Users(
                                    userName: userNameController.text,
                                    userEmail: emailController.text,
                                    userPassword: passwordController.text,
                                    userPhone: phoneController.text,
                                  ),
                                );
                      
                                navigate(context: context, screen: Home());
                              }
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
