import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/domain/login_validation.dart';
import 'package:cyber_bee/presentation/auth/login/widgets/register_account_button.dart';
import 'package:cyber_bee/presentation/auth/login/widgets/username_valid_field.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _saveLogin = ValueNotifier<bool>(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UsernameCheckTextField(userNameController: _userNameController),
              k30Height,
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: MyTextStyles.h4,
                controller: _passwordController,
                decoration: myFormFieldInputDecoration(
                  icon: Icons.lock_person,
                  hintText: 'Password',
                ),
              ),
              k10Height,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password',
                  style: MyTextStyles.h5.copyWith(
                    fontSize: 10,
                  ),
                ),
              ),
              k10Height,
              Transform.scale(
                scale: 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Remeber me',
                      style: MyTextStyles.h4,
                    ),
                    k10Width,
                    ValueListenableBuilder<bool>(
                      valueListenable: _saveLogin,
                      builder: (context, v, _) {
                        return Switch(
                          activeColor: MyColors.primaryRedColor,
                          activeTrackColor: MyColors.backgroundBlackColor,
                          inactiveTrackColor: MyColors.backgroundBlackColor,
                          trackOutlineColor: MaterialStateProperty.all(
                            const Color(0xFF6C63FF),
                          ),
                          value: _saveLogin.value,
                          onChanged: (value) {
                            _saveLogin.value = !_saveLogin.value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              k30Height,
              k10Height,
              Center(
                child: MyCustomButton(
                  function: () async => ValidateLogin.validate(
                    context: context,
                    formKey: _formKey,
                    username: _userNameController.text,
                    password: _passwordController.text,
                    isAutoLogin: _saveLogin.value,
                  ),
                  text: 'Login',
                ),
              ),
              k30Height,
              const RegisterAccount()
            ],
          ),
        ),
      ),
    );
  }
}
