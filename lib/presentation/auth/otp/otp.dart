import 'package:cyber_bee/domain/auth/timer.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase_auth/firebase_auth.dart';
import 'package:cyber_bee/presentation/auth/sign_up/sign_up.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final TextEditingController _oTPcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ratioSize(4),
              Pinput(
                length: 6,
                controller: _oTPcontroller,
                defaultPinTheme: PinTheme(
                  margin: const EdgeInsets.all(4),
                  width: 45,
                  height: 50,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: MyColors.textWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.secondaryGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              k20Height,
              StreamBuilder(
                stream: SetTimer.timer(30),
                builder: (context, snapshot) => snapshot.data == null
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '00:${snapshot.data!.toInt() < 10 ? '0' : ''}${snapshot.data} ',
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
                            function: () async =>
                                await MyFirebaseAuth.verifyOTP(
                                        smsCode: _oTPcontroller.text,
                                        context: context)
                                    .then((value) {
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
                            }),
                            text: 'Verify',
                            color: snapshot.data == 0
                                ? MyColors.textGreyColor
                                : null,
                          ),
                        ],
                      ),
              ),
              ratioSize(10),
            ],
          ),
        ),
      ),
    );
  }
}
