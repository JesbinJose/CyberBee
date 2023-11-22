import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/auth/otp/widgets/otp_timer_widget.dart';
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
              OTPTimerWidget(oTPcontroller: _oTPcontroller),
              ratioSize(10),
            ],
          ),
        ),
      ),
    );
  }
}

