import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/presentation/auth/phone_number/phone_number.dart';
import 'package:flutter/material.dart';

class RegisterAccount extends StatelessWidget {
  const RegisterAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account ? ',
          style: MyTextStyles.h6.copyWith(
            fontSize: 12,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthPhoneScreen(),
            ),
          ),
          child: Text(
            'register here',
            style: MyTextStyles.h2.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}