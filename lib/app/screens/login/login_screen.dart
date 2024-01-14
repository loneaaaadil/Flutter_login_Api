import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:login_asignment/app/screens/login/login_controller.dart';
import 'package:login_asignment/app/utils/app_strings.dart';

import '../widgets/login_screen_widget.dart';

class LoginPage extends GetView<LoginController> {
  final List<String> socialIcons = [
    'assets/images/google.png',
    'assets/images/instagram.png',
    'assets/images/facebook.png',
    'assets/images/linkedin.png',
    'assets/images/whatsapp.png',
  ];

  LoginPage({super.key});
  final GlobalKey<FormState>? formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.w),
                child: Center(
                  child: LoginText(
                    text: AppStrings.appTitle,
                    textStyle: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Gap(50.h),
              Center(
                child: LoginText(
                  text: AppStrings.welcome,
                  textStyle: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(40.h),
              Padding(
                padding: EdgeInsets.only(left: 35.0.w),
                child: LoginText(
                  text: AppStrings.signInCont,
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(10.h),
              LoginFormField(
                controller: controller.usernameC,
                labelText: AppStrings.labelText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null; // Return null if the input is valid
                },
                onChange: (v) {
                  if (formkey!.currentState!.validate()) {
                    controller.isButtonActive.value = true;
                  } else {
                    controller.isButtonActive.value = false;
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.0.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: LoginTextButton(
                    onpressed: () {},
                    text: 'Sign In With OTP',
                  ),
                ),
              ),
              Gap(15.0.h),
              Padding(
                padding: EdgeInsets.only(left: 35.0.sp),
                child: LoginText(
                  text: 'Password',
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(5.0.h),
              LoginFormField(
                controller: controller.passwordC,
                labelText: 'Enter Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Please enter your valid password';
                  }
                  return null;
                },
                onChange: (v) {
                  if (formkey!.currentState!.validate()) {
                    controller.isButtonActive.value = true;
                  } else {
                    controller.isButtonActive.value = false;
                  }
                },
              ),
              Gap(5.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.0.w),
                        child: Checkbox(
                          value: false,
                          onChanged: (v) {},
                        ),
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0.sp),
                    child: LoginTextButton(
                      text: 'Forget Passord',
                      onpressed: () {},
                    ),
                  )
                ],
              ),
              Gap(20.0.h),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: SizedBox(
                    height: 50.0.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: (controller.isButtonActive.value)
                          ? () {
                              if (formkey!.currentState!.validate()) {
                                controller.loginWithEmail();
                              }
                            }
                          : null,
                      // () {
                      //
                      // },
                      child: Text(
                        'Submit',
                        style:
                            TextStyle(fontSize: 14.0.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30.0.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      indent: 30.0.w,
                      endIndent: 5.0.w,
                    ),
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      indent: 5.0.w,
                      endIndent: 30.0.w,
                    ),
                  ),
                ],
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: socialIcons
                      .map((e) => Image.asset(height: 45.0.h, e))
                      .toList(),
                ),
              ),
              Gap(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Business User?'),
                  Gap(20.w),
                  const Text("Don't have an account"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Login Here'),
                    ),
                    // Gap(100.w),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, bottom: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "By continuing, you agree to\n Promilo's ",
                    children: [
                      TextSpan(
                        text: 'Terms of Use & Privacy Policy.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
