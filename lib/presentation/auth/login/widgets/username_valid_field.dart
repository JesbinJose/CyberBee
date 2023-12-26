import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';

class UsernameCheckTextField extends StatelessWidget {
  const UsernameCheckTextField({
    super.key,
    required TextEditingController userNameController,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'User name',
      validator: (value) {
        if (value == null || value.isEmpty) return 'UserName is required';
        return null;
      },
      controller: _userNameController,
    );
  }
}
