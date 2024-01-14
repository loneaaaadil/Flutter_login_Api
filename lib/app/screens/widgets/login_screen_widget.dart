import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  const LoginFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
      ),
    );
  }
}

class LoginTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const LoginTextButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const LoginText({
    super.key,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}
