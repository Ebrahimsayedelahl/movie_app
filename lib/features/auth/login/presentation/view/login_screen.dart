import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/funcation/funcation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_style/app_style.dart';
import 'package:movie_app/core/widgets/custom_back_button.dart';
import 'package:movie_app/core/widgets/custom_text_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_filed.dart';
import 'package:movie_app/features/auth/register/presentation/view/register_screen.dart';


class LoginScreen extends StatelessWidget {
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

   LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: formKey,
        child: Scaffold(
        backgroundColor: Colors.grey[900],
        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
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
                  height: 170.h,
                  width: 170.w,
                )),
                SizedBox(
                  height: 76.h,
                ),
                Container(
                  //height: 490.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
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
                          height: 8.h,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              // style: AppStyles.style18,
                              style:
                                  TextStyle(fontSize: 15.sp, color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                navigate(context: context, screen: RegisterScreen());
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: const Color(0xffFFC700),
                                    fontSize: 18.sp,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextButton(title: 'Login', onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text('Processing Data')),
                            );
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



