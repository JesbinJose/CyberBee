import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase_auth/firebase_auth.dart';
import 'package:cyber_bee/domain/auth/timer.dart';
import 'package:cyber_bee/presentation/auth/sign_up/sign_up.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OTPTimerWidget extends StatelessWidget {
  const OTPTimerWidget({
    super.key,
    required TextEditingController oTPcontroller,
  }) : _oTPcontroller = oTPcontroller;

  final TextEditingController _oTPcontroller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SetTimer.timer(59),
      builder: (context, snapshot) {
        final int? data = snapshot.data;
        return data == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '00:${data.toInt() < 10 ? '0' : ''}$data',
                        style: MyTextStyles.h6.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Resend OTP',
                        style: MyTextStyles.h6.copyWith(
                          color: MyColors.textRedColor,
                        ),
                      ),
                    ],
                  ),
                  k20Height,
                  MyCustomButton(
                    function: () async => await MyFirebaseAuth.verifyOTP(
                      smsCode: _oTPcontroller.text,
                      context: context,
                    ).then(
                      (value) {
                        if (value.isNotEmpty) {
                          _oTPcontroller.dispose();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUPScreen(
                                userId: value,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    text: 'Verify',
                    color: snapshot.data == 0 ? MyColors.textGreyColor : null,
                  ),
                ],
              );
      },
    );
  }
}
